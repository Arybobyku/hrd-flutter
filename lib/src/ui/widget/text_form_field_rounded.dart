import 'package:flutter/material.dart';
import 'package:hrd/src/common/utility/dartdroid_fonts.dart';

import '../../common/common.dart';

class TextFormFieldRounded extends StatelessWidget {
  final String? initialValue;
  final String label;
  final ValueChanged<String> onChange;
  final Widget? suffixIcon;
  final bool secureText;
  final TextInputType keyboardType;
  final String? errortext;
  final FormFieldValidator? validatorCheck;
  final TextEditingController? controller;

  const TextFormFieldRounded({
    Key? key,
    required this.label,
    required this.onChange,
    this.validatorCheck,
    this.initialValue,
    this.suffixIcon,
    this.keyboardType = TextInputType.text,
    this.errortext,
    this.secureText = false,
    this.controller
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      validator: validatorCheck,
      controller: controller,
      onChanged: onChange,
      obscureText: secureText,
      cursorColor: DartdroidColor.primary,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        errorText: errortext,
        filled: false,
        hoverColor: DartdroidColor.primary,
        hintStyle:  DartDroidFonts.normal(
          color: DartdroidColor.primary,
        ),
        labelText: label,
        suffixIcon: suffixIcon,
        focusColor: DartdroidColor.primary,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 10, vertical: 18),
        border: const OutlineInputBorder(
          borderSide: BorderSide(
            color: DartdroidColor.primary,
            width: 1,
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
          borderSide: BorderSide(
            color: DartdroidColor.primary,
            width: 1,
          ),
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
          borderSide: BorderSide(
            color: DartdroidColor.greyLighten30,
            width: 1,
          ),
        ),
      ),
    );
  }
}
