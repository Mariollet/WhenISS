import 'dart:ui';

import 'package:wheniss/services/app_colors.dart';

class IssVisibility {
  IssVisibility({
    required this.date,
    required this.startTime,
    required this.startAzimuth,
    required this.maxTime,
    required this.maxAzimuth,
    required this.endTime,
    required this.endAzimuth,
    required this.duration,
    required this.magnitude,
    required this.visibility,
    required this.startDateTime,
  });

  final String date;
  final String startTime;
  final String startAzimuth;
  final String maxTime;
  final String maxAzimuth;
  final String endTime;
  final String endAzimuth;
  final String duration;
  final String magnitude;
  final Visibility visibility;
  final DateTime startDateTime;

  static int monthStringToNumber(String month) {
    switch (month.toLowerCase()) {
      case "janvier":
        return 1;
      case "février":
        return 2;
      case "mars":
        return 3;
      case "avril":
        return 4;
      case "mai":
        return 5;
      case "juin":
        return 6;
      case "juillet":
        return 7;
      case "août":
        return 8;
      case "septembre":
        return 9;
      case "octobre":
        return 10;
      case "novembre":
        return 11;
      case "décembre":
        return 12;
      default:
        throw FormatException("Invalid month string");
    }
  }

  factory IssVisibility.fromJson(final Map<String, dynamic> json) {
    // startDateTime is parsed from date and startTime : {"date":"Mardi 14 Janvier 2025","startTime":"18:48:04"}
    final dateParts = json["date"].split(" ");
    final day = int.parse(dateParts[1]);
    final month = monthStringToNumber(dateParts[2]);
    final year = int.parse(dateParts[3]);
    final timeParts = json["startTime"].split(":");
    final hour = int.parse(timeParts[0]);
    final minute = int.parse(timeParts[1]);
    final second = int.parse(timeParts[2]);
    final startDateTime = DateTime(year, month, day, hour, minute, second);

    return IssVisibility(
      date: json["date"],
      startTime: json["startTime"],
      startAzimuth: json["startAzimuth"],
      maxTime: json["maxTime"],
      maxAzimuth: json["maxAzimuth"],
      endTime: json["endTime"],
      endAzimuth: json["endAzimuth"],
      duration: json["duration"],
      magnitude: json["magnitude"],
      visibility: json["visibility"].toString().isEmpty
          ? Visibility.unknown
          : Visibility.fromString(json["visibility"]),
      startDateTime: startDateTime,
    );
  }

  static List<IssVisibility> fromJsonList(final List<dynamic> jsonList) {
    return jsonList.map((json) => IssVisibility.fromJson(json)).toList();
  }
}

enum Visibility {
  moyenne,
  bonne,
  unknown;

  String toShortString() {
    switch (this) {
      case Visibility.moyenne:
        return "Moyenne";
      case Visibility.bonne:
        return "Bonne";
      case Visibility.unknown:
        return "Inconnue";
    }
  }

  Color toColor() {
    switch (this) {
      case Visibility.moyenne:
        return AppColors.secondary;
      case Visibility.bonne:
        return AppColors.success;
      case Visibility.unknown:
        return AppColors.grey;
    }
  }

  static Visibility fromString(final String visibility) {
    switch (visibility) {
      case "Moyenne":
        return Visibility.moyenne;
      case "Bonne":
        return Visibility.bonne;
      default:
        return Visibility.unknown;
    }
  }
}
