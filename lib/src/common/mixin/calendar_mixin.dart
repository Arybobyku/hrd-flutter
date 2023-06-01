import 'package:flutter/material.dart';
import 'package:hrd/src/common/common.dart';

mixin CalendarMixin {
  Future showDatePickerDialog(BuildContext context,
      {DateTime? firstData, DateTime? lastDate}) {
    return showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: firstData ?? DateTime(1800),
      lastDate: lastDate ?? DateTime(2500),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: DartdroidColor.primary,
              onPrimary: DartdroidColor.white,
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: DartdroidColor.primary,
              ),
            ),
          ),
          child: child!,
        );
      },
    );
  }

  Future showTimePickerDialog(BuildContext context, {TimeOfDay? initialTime}) {
    return showTimePicker(
      context: context,
      initialEntryMode: TimePickerEntryMode.dial,
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: DartdroidColor.primary,
              onPrimary: DartdroidColor.white,
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: DartdroidColor.primary,
              ),
            ),
          ),
          child: child!,
        );
      },
      initialTime: initialTime ?? const TimeOfDay(hour: 0, minute: 0),
    );
  }
}
