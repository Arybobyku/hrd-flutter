import 'dart:ui';

import 'package:hrd/src/common/utility/utility.dart';

mixin StatusMixin{

  Color statusBackgroundColor(String status){
    switch(status){
      case "APPROVE": return DartdroidColor.greenBackgroundStatus;
      case "REJECT": return DartdroidColor.redBackgroundStatus;
      case "PENDING": return DartdroidColor.yellowBackgroundStatus;
      default: return DartdroidColor.greyLighten30;
    }
  }

  Color statusTextColor(String status){
    switch(status){
      case "APPROVE": return DartdroidColor.greenTextStatus;
      case "REJECT": return DartdroidColor.redTextStatus;
      case "PENDING": return DartdroidColor.yellowTextStatus;
      default: return DartdroidColor.black;
    }
  }
}