// ignore_for_file: unused_result

import "dart:async";

import "package:flutter_local_notifications/flutter_local_notifications.dart";
import "package:wheniss/data/api.dart";
import "package:wheniss/data/models/iss_visibility.dart";
import "package:wheniss/data/repository/iss/iss_repository.dart";
import "package:wheniss/data/repository/iss/iss_visibility_notification_repository.dart";
import "package:wheniss/env.dart";
import "package:wheniss/services/app_colors.dart";
import "package:wheniss/ui/shared/app_scaffold.dart";
import "package:wheniss/ui/shared/loader.dart";
import "package:wheniss/ui/view_model/iss_view_model.dart";
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class ISSVisibilityView extends StatelessWidget {
  const ISSVisibilityView({super.key});

  @override
  Widget build(final BuildContext context) {
    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
        FlutterLocalNotificationsPlugin();
    flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.requestNotificationsPermission();
    flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.requestExactAlarmsPermission();
    // initialise the plugin. app_icon needs to be a added as a drawable resource to the Android head project
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@drawable/ic_launcher_monochrome');
    final DarwinInitializationSettings initializationSettingsDarwin =
        DarwinInitializationSettings();
    final LinuxInitializationSettings initializationSettingsLinux =
        LinuxInitializationSettings(defaultActionName: 'Open notification');
    final InitializationSettings initializationSettings =
        InitializationSettings(
            android: initializationSettingsAndroid,
            iOS: initializationSettingsDarwin,
            macOS: initializationSettingsDarwin,
            linux: initializationSettingsLinux);
    flutterLocalNotificationsPlugin.initialize(initializationSettings);

    tz.initializeTimeZones();
    tz.setLocalLocation(tz.getLocation('Europe/Paris'));

    // Méthode pour afficher une notification
    Future<void> showNotification(IssVisibility visibility) async {
      AndroidNotificationDetails androidPlatformChannelSpecifics =
          AndroidNotificationDetails(
        '1', // ID unique pour la notification
        'main', // Nom du canal
        channelDescription: 'main channel', // Description
        importance: Importance.high,
        priority: Priority.high,
        ticker: 'ticker',
      );

      NotificationDetails platformChannelSpecifics =
          NotificationDetails(android: androidPlatformChannelSpecifics);

      await flutterLocalNotificationsPlugin.show(
        visibility.startDateTime.hashCode, // ID unique pour la notification
        'WhenISS 🛰️', // Titre
        'RDV ${visibility.date} à ${visibility.startTime.toString()} 📡', // Contenu
        platformChannelSpecifics,
      );
    }

    // Méthode pour afficher une notification programmée
    Future<void> scheduleNotification(IssVisibility visibility) async {
      AndroidNotificationDetails androidPlatformChannelSpecifics =
          AndroidNotificationDetails(
        '1', // ID unique pour la notification
        'main', // Nom du canal
        channelDescription: 'main channel', // Description
        importance: Importance.high,
        priority: Priority.high,
        ticker: 'ticker',
      );

      // ignore: unused_local_variable
      NotificationDetails platformChannelSpecifics =
          NotificationDetails(android: androidPlatformChannelSpecifics);

      final tz.TZDateTime tzStartTime =
          tz.TZDateTime.from(visibility.startDateTime, tz.local);

      await flutterLocalNotificationsPlugin.zonedSchedule(
        visibility.startDateTime.hashCode + 1,
        'WhenISS - Visibilité prochaine 🛰️',
        'L\'ISS sera visible à ${visibility.startTime} 📡',
        tzStartTime.subtract(
          const Duration(hours: 1),
        ),
        const NotificationDetails(
          android: AndroidNotificationDetails(
            '1',
            'main',
            channelDescription: 'main channel',
          ),
        ),
        androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
      );
      await flutterLocalNotificationsPlugin.zonedSchedule(
        visibility.startDateTime.hashCode + 2,
        'WhenISS - Visibilité en cours 🛰️',
        'L\'ISS est visible jusqu\'à ${visibility.endTime} 📡',
        tzStartTime,
        const NotificationDetails(
          android: AndroidNotificationDetails(
            '1',
            'main',
            channelDescription: 'main channel',
          ),
        ),
        androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
      );
    }

    // Méthode pour enlever une notification programmée
    Future<void> cancelNotification(DateTime startDateTime) async {
      await flutterLocalNotificationsPlugin.cancel(startDateTime.hashCode);
      await flutterLocalNotificationsPlugin.cancel(startDateTime.hashCode + 1);
      await flutterLocalNotificationsPlugin.cancel(startDateTime.hashCode + 2);
    }

    // Méthode pour synchroniser les notifications avec les nouvelles visibilités
    Future<void> syncNotifications(
      final List<IssVisibility> issVisibility,
      final List<String> visibilityNotificationList,
      final WidgetRef ref,
    ) async {
      bool refresh = false;

      for (var visibilityNotification in visibilityNotificationList) {
        // check if the notification date is before now, if yes, remove it
        DateTime? notificationDateTime;
        try {
          notificationDateTime =
              DateTime.parse(visibilityNotification).toLocal();
        } catch (e) {
          ref.read(
              deleteVisibilityNotificationRepository(visibilityNotification));
          continue;
        }
        final DateTime now = DateTime.now().toLocal();
        if (notificationDateTime.isBefore(now)) {
          ref.read(
            deleteVisibilityNotificationRepository(visibilityNotification),
          );
          continue;
        }

        // if two same visibilityNotification, remove one
        if (visibilityNotificationList
                .where((element) => element == visibilityNotification)
                .length >
            1) {
          ref.read(
            deleteVisibilityNotificationRepository(visibilityNotification),
          );
          continue;
        }

        // get day of visibilityNotification
        final int day = notificationDateTime.day;
        final int month = notificationDateTime.month;
        final int year = notificationDateTime.year;

        // On each issVisibility, if the date is the same as the visibilityNotification,
        // remove the visibilityNotification from the list, add the new one and send notification
        for (var visibility in issVisibility) {
          if (visibility.startDateTime.day == day &&
              visibility.startDateTime.month == month &&
              visibility.startDateTime.year == year &&
              (visibility.startDateTime.hour != notificationDateTime.hour ||
                  visibility.startDateTime.minute !=
                      notificationDateTime.minute ||
                  visibility.startDateTime.second !=
                      notificationDateTime.second)) {
            refresh = true;

            await ref.read(
              deleteVisibilityNotificationRepository(visibilityNotification)
                  .future,
            );
            if (!visibilityNotificationList
                .contains(visibility.startDateTime.toString())) {
              await ref.read(
                writeVisibilityNotificationRepository(
                  visibility.startDateTime.toString(),
                ).future,
              );
            }

            cancelNotification(notificationDateTime);
            scheduleNotification(visibility);
          }
        }
      }

      if (refresh) ref.refresh(readVisibilityNotificationRepository);
    }

    return AppScaffold(
      appBar: false,
      tabIndex: 1,
      padding: const EdgeInsets.all(4),
      body: Consumer(
        builder: (_, final WidgetRef ref, final Widget? child) {
          final List<IssVisibility>? issVisibility =
              ref.watch(issVisibilityProvider);

          final List<String> visibilityNotificationList =
              ref.watch(readVisibilityNotificationRepository).maybeWhen(
                    data: (data) => data,
                    orElse: () => [],
                  );

          if (issVisibility == null) {
            ref.read(issVisibilityRepository);
            return child!;
          } else {
            syncNotifications(issVisibility, visibilityNotificationList, ref);
          }

          return Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: const EdgeInsets.all(12),
                    child: Text(
                      "Prochaines visibilités",
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: AppColors.black,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () async {
                      if (Environment.appDebug) {
                        await Api.secureStorage
                            .delete(key: "visibilityNotificationList");
                        ref.refresh(readVisibilityNotificationRepository);
                      }
                    },
                    child: Container(
                      margin: const EdgeInsets.all(10),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 5,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        "Montpellier",
                        style: const TextStyle(
                          color: AppColors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              /// list of notifications
              if (Environment.appDebug) ...[
                ListView(
                  shrinkWrap: true,
                  children: [
                    for (var visibility in visibilityNotificationList)
                      ListTile(
                        title: Text(visibility),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () async {
                            await cancelNotification(
                                DateTime.parse(visibility));
                            await ref.read(
                              deleteVisibilityNotificationRepository(visibility)
                                  .future,
                            );
                            ref.refresh(readVisibilityNotificationRepository);
                          },
                        ),
                      ),
                  ],
                ),
              ],
              Divider(
                color: AppColors.grey.withOpacity(0.2),
                thickness: 1,
              ),
              Expanded(
                child: Scrollbar(
                  thumbVisibility: true,
                  child: ListView.builder(
                    padding: const EdgeInsets.all(10),
                    itemCount: issVisibility.length,
                    itemBuilder: (context, index) {
                      final visibility = issVisibility[index];
                      return Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Stack(
                          children: [
                            VisibilityCard(visibility: visibility),
                            Positioned(
                              right: 2,
                              top: 10,
                              child: IconButton(
                                icon: Icon(
                                  visibilityNotificationList.contains(
                                          visibility.startDateTime.toString())
                                      ? Icons.notifications_active
                                      : Icons.notifications_none,
                                  size: 24,
                                  color: AppColors.primary,
                                ),
                                onPressed: () async {
                                  if (!visibilityNotificationList.contains(
                                      visibility.startDateTime.toString())) {
                                    showNotification(visibility);
                                    scheduleNotification(visibility);

                                    await ref.read(
                                      writeVisibilityNotificationRepository(
                                        visibility.startDateTime.toString(),
                                      ).future,
                                    );

                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          "Notification du ${visibility.date} programmée.",
                                          style: TextStyle(
                                            color: AppColors.white,
                                          ),
                                        ),
                                        backgroundColor:
                                            AppColors.primary.withOpacity(0.8),
                                        duration: const Duration(seconds: 1),
                                      ),
                                    );

                                    ref.refresh(
                                        readVisibilityNotificationRepository);
                                  } else {
                                    cancelNotification(
                                        visibility.startDateTime);

                                    await ref.read(
                                      deleteVisibilityNotificationRepository(
                                        visibility.startDateTime.toString(),
                                      ).future,
                                    );

                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          "Notification du ${visibility.date} supprimée.",
                                          style: TextStyle(
                                            color: AppColors.white,
                                          ),
                                        ),
                                        backgroundColor:
                                            AppColors.primary.withOpacity(0.8),
                                        duration: const Duration(seconds: 1),
                                      ),
                                    );

                                    ref.refresh(
                                        readVisibilityNotificationRepository);
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          );
        },
        child: const Loader(color: AppColors.primary, radius: 32),
      ),
    );
  }
}

class VisibilityCard extends StatelessWidget {
  const VisibilityCard({
    super.key,
    required this.visibility,
  });

  final IssVisibility visibility;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 125,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: AppColors.black.withOpacity(0.2),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        clipBehavior: Clip.hardEdge,
        child: Row(
          children: [
            Container(
              width: 14,
              height: 125,
              color: visibility.visibility.toColor(),
            ),
            Flexible(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    visibility.date
                        .split(' ')
                        .sublist(0, visibility.date.split(' ').length - 1)
                        .join(' '),
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.visibility,
                        color: visibility.visibility.toColor(),
                        size: 18,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        visibility.visibility.toShortString(),
                        style: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(width: 20),
            Flexible(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Column(
                  children: [
                    // Start and End Time
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.play_circle_fill,
                                color: AppColors.grey, size: 18),
                            const SizedBox(width: 5),
                            Text(visibility.startTime),
                          ],
                        ),
                        Row(
                          children: [
                            const Icon(Icons.stop_circle,
                                color: AppColors.grey, size: 18),
                            const SizedBox(width: 5),
                            Text(visibility.endTime),
                          ],
                        ),
                      ],
                    ),
                    const Spacer(),
                    Column(
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.timer,
                                color: AppColors.grey, size: 18),
                            const SizedBox(width: 5),
                            Text("${visibility.duration} secondes"),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.brightness_5,
                                color: AppColors.grey, size: 18),
                            const SizedBox(width: 5),
                            Text("Mag : ${visibility.magnitude}"),
                          ],
                        ),
                      ],
                    ),
                    // Duration and Magnitude
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
