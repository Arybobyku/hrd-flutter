import 'package:flutter/material.dart';
import 'package:hrd/src/common/common.dart';

class ButtonRounded extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool invert;
  final bool disabled;

  const ButtonRounded(
      {Key? key,
      this.onPressed,
      required this.text,
      this.invert = false,
      this.disabled = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 15.0),
      decoration: BoxDecoration(
        color: invert ? DartdroidColor.white : DartdroidColor.primary,
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextButton(
        onPressed: onPressed,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Text(
            text,
            style: TextStyle(
              color: invert ? DartdroidColor.primary : DartdroidColor.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
