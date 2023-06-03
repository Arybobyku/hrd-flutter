import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  String get generalFormatDate {
    return DateFormat("EEEE, dd MMM yyyy").format(this);
  }

  String get generalFormatTime {
    return DateFormat("HH:mm:ss").format(this);
  }

  String get clockInFormat {
    return DateFormat("yyyy-MM-dd").format(this);
  }
}
