import 'dart:ui';

import 'package:hrd/src/common/utility/utility.dart';

mixin StatusMixin{

  Color statusBackgroundColor(String status){
    switch(status){
      case "APPROVE": return DartdroidColor.greenBackgroundStatus;
      case "REJECT": return DartdroidColor.redBackgroundStatus;
      case "PENDING": return DartdroidColor.yellowBackgroundStatus;

      case "ONTIME":return DartdroidColor.greenBackgroundStatus;
      case "LATE": return DartdroidColor.redBackgroundStatus;
      default: return DartdroidColor.greyLighten30;
    }
  }

  Color statusTextColor(String status){
    switch(status){
      case "APPROVE": return DartdroidColor.greenTextStatus;
      case "REJECT": return DartdroidColor.redTextStatus;
      case "PENDING": return DartdroidColor.yellowTextStatus;

      case "ONTIME": return DartdroidColor.greenTextStatus;
      case "LATE": return DartdroidColor.redTextStatus;
      default: return DartdroidColor.black;
    }
  }
}