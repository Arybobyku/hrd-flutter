import 'package:flutter/material.dart';
import 'package:hrd/src/common/common.dart';

extension ParseFontFamily on FontFamily? {
  String get asString {
    switch (this) {
      case FontFamily.poppins:
        return fontFamilyPoppins;
      case FontFamily.satisfy:
        return fontFamilySatisfy;
      default:
        return fontFamilyLato;
    }
  }
}

enum FontFamily {
  lato,
  poppins,
  satisfy,
}

const String fontFamilyLato = 'Lato';
const String fontFamilyPoppins = 'Poppins';
const String fontFamilySatisfy = 'Satisfy';

class DartdroidFont {
  static const FontWeight fontWeightExtraBold = FontWeight.w900;
  static const FontWeight fontWeightBolder = FontWeight.w800;
  static const FontWeight fontWeightBold = FontWeight.w700;
  static const FontWeight fontWeightSemiBold = FontWeight.w600;
  static const FontWeight fontWeightMedium = FontWeight.w500;
  static const FontWeight fontWeightRegular = FontWeight.w400;
  static const FontWeight fontWeightLight = FontWeight.w300;
  static const FontWeight fontWeightLighter = FontWeight.w200;
  static const FontWeight fontWeightThin = FontWeight.w100;

  static TextStyle regular14({
    FontFamily? family,
    TextDecoration? decoration,
    Color? color,
    double? height,
    double? latterSpacing,
  }) =>
      TextStyle(
        fontSize: 14.0,
        fontFamily: family.asString,
        fontWeight: fontWeightRegular,
        color: color ?? DartdroidColor.black,
        decoration: decoration,
        height: height,
        letterSpacing: latterSpacing,
      );
}
