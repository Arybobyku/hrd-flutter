import 'package:intl/intl.dart';

mixin DateMixin{

  String parseDate(DateTime dateTime){
    DateFormat dateFormat = DateFormat("yyyy-MM-dd");
    String result = dateFormat.format(dateTime);
    return result;
  }
}