import 'package:flutter/material.dart';
import 'package:hrd/src/common/utility/dartdroid_fonts.dart';
import 'package:hrd/src/common/common.dart';

class ButtonRounded extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool disabled;
  final FontWeight fontWeight;
  final double borderRadius;

  const ButtonRounded({
    Key? key,
    this.onPressed,
    required this.text,
    this.borderRadius = 15,
    this.disabled = false,
    this.fontWeight = FontWeight.bold,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 15.0),
      decoration: BoxDecoration(
        color: disabled ? DartdroidColor.greyLighten70 : DartdroidColor.primary,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: TextButton(
        onPressed: onPressed,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Text(
            text,
            style: DartDroidFonts.customFontWeight(
              color: disabled
                  ? DartdroidColor.greyLighten10
                  : DartdroidColor.white,
              fontSize: 18,
              fontWeight:fontWeight,
            ),
          ),
        ),
      ),
    );
  }
}
