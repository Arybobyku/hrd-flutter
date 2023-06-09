import 'package:intl/intl.dart';

extension StringFormatMixin on String? {
  String get firstLetter {
    return this?[0].toUpperCase() ?? "";
  }

  String get timeFormat{
    var parsedDate = DateTime.parse(this!);

    return DateFormat("HH:mm").format(parsedDate).toString();
  }

  String get dateFormat{
    var parsedDate = DateTime.parse(this!);

    return DateFormat("dd MMMM yyyy").format(parsedDate).toString();
  }
}
