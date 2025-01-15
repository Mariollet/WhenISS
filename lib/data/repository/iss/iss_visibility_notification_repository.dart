import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:wheniss/data/api.dart";

final readVisibilityNotificationRepository =
    FutureProvider.autoDispose<List<String>>(
  (ref) async {
    final visibilityNotificationList =
        await Api.secureStorage.read(key: "visibilityNotificationList");
    final visibilityNotificationListArray =
        visibilityNotificationList?.split(",") ?? [];

    return visibilityNotificationListArray;
  },
);

final writeVisibilityNotificationRepository =
    FutureProvider.autoDispose.family<void, String>(
  (ref, visibilityNotification) async {
    final visibilityNotificationList =
        await Api.secureStorage.read(key: "visibilityNotificationList") ?? "";

    final List<String> visibilityNotificationListArray =
        visibilityNotificationList.isNotEmpty
            ? visibilityNotificationList.split(",")
            : [];

    // Add visibilityNotification to the list
    visibilityNotificationListArray.add(visibilityNotification);
    await Api.secureStorage.write(
        key: "visibilityNotificationList",
        value: visibilityNotificationListArray.join(","));

    return;
  },
);

final deleteVisibilityNotificationRepository =
    FutureProvider.autoDispose.family<void, String>(
  (ref, visibilityNotification) async {
    final visibilityNotificationList =
        await Api.secureStorage.read(key: "visibilityNotificationList") ?? "";

    final List<String> visibilityNotificationListArray =
        visibilityNotificationList.isNotEmpty
            ? visibilityNotificationList.split(",")
            : [];

    // Remove visibilityNotification from the list
    visibilityNotificationListArray.remove(visibilityNotification);

    if (visibilityNotificationListArray.isEmpty) {
      await Api.secureStorage.delete(key: "visibilityNotificationList");
    } else {
      await Api.secureStorage.write(
          key: "visibilityNotificationList",
          value: visibilityNotificationListArray.join(","));
    }

    return;
  },
);
