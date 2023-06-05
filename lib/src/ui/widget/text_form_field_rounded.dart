import 'package:flutter/material.dart';

import '../../common/common.dart';

class TextFormFieldRounded extends StatelessWidget with WidgetMixin {
  final String? title;
  final bool isRequired;
  final String? initialValue;
  final String? label;
  final ValueChanged<String> onChange;
  final Widget? suffixIcon;
  final bool secureText;
  final TextInputType keyboardType;
  final String? errorText;
  final FormFieldValidator? validatorCheck;
  final TextEditingController? controller;
  final bool readOnly;
  final int minLines;

  TextFormFieldRounded({
    Key? key,
    this.label,
    this.title,
    this.isRequired = false,
    required this.onChange,
    this.validatorCheck,
    this.initialValue,
    this.suffixIcon,
    this.keyboardType = TextInputType.text,
    this.errorText,
    this.secureText = false,
    this.readOnly = false,
    this.controller,
    this.minLines = 1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: RichText(
                  text: TextSpan(
                    text: title,
                    style: DartDroidFonts.normal(
                      fontSize: 16,
                      color: DartdroidColor.greyLighten8,
                    ),
                    children: [
                      if (isRequired) ...[
                        TextSpan(
                          text: ' *',
                          style: DartDroidFonts.normal(
                            color: DartdroidColor.redDarken40,
                          ),
                        )
                      ],
                    ],
                  ),
                ),
              ),
              verticalSpace5,
            ],
          ),
        TextFormField(
          initialValue: initialValue,
          validator: validatorCheck,
          controller: controller,
          onChanged: onChange,
          obscureText: secureText,
          cursorColor: DartdroidColor.primary,
          keyboardType: keyboardType,
          readOnly: readOnly,
          minLines: minLines,
          maxLines: secureText ? 1 : 10,
          decoration: InputDecoration(
            errorText: errorText,
            filled: false,
            hoverColor: DartdroidColor.primary,
            hintStyle: DartDroidFonts.normal(
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
        ),
      ],
    );
  }
}
