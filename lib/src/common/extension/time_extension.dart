import 'package:flutter/material.dart';

extension TimeExtension on TimeOfDay {
  String get to24hours {
    final hour = this.hour.toString().padLeft(2, "0");
    final min = minute.toString().padLeft(2, "0");
    return "$hour:$min";
  }
}
