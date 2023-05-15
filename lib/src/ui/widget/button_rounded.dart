import 'package:flutter/material.dart';
import 'package:hrd/src/common/utility/dartdroid_fonts.dart';
import 'package:hrd/src/common/common.dart';

class ButtonRounded extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool disabled;
  final bool invert;
  final FontWeight fontWeight;
  final double borderRadius;

  const ButtonRounded({
    Key? key,
    this.onPressed,
    required this.text,
    this.borderRadius = 10,
    this.invert = false,
    this.disabled = false,
    this.fontWeight = FontWeight.normal,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: disabled
            ? DartdroidColor.greyLighten70
            : invert
                ? DartdroidColor.white
                : DartdroidColor.primary,
        borderRadius: BorderRadius.circular(borderRadius),
        border: invert ? Border.all(color: DartdroidColor.primary) : null,
      ),
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: DartDroidFonts.customFontWeight(
            color: disabled
                ? DartdroidColor.greyLighten10
                : invert
                    ? DartdroidColor.primary
                    : DartdroidColor.white,
            fontSize: 18,
            fontWeight: fontWeight,
          ),
        ),
      ),
    );
  }
}
