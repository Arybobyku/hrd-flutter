
import 'package:flutter/material.dart';
import 'package:hrd/src/common/common.dart';

const String dartdroidFontFamily = 'Poppins';

class DartDroidFonts {
  static TextStyle? normal({
    double fontSize = 12,
    Color color = DartdroidColor.black,
  }) =>
      TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.normal,
        color: color,
        fontFamily: dartdroidFontFamily,
      );

  static TextStyle bold({
    double fontSize = 12,
    Color color = DartdroidColor.black,
  }) =>
      TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.bold,
        color: color,
        fontFamily: dartdroidFontFamily,
      );

  static TextStyle customFontWeight( {
    required FontWeight fontWeight,
    double fontSize = 12,
    Color color = DartdroidColor.black,
  }) =>
      TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
        fontFamily: dartdroidFontFamily,
      );
}
