import 'package:flutter/material.dart';
import 'package:hrd/src/common/common.dart';
import 'package:hrd/src/common/extension/time_extension.dart';

class FormTimeDayWidget extends StatelessWidget with WidgetMixin{
   FormTimeDayWidget({
    Key? key,
    this.title,
    this.titleStyle,
    this.subtitle,
    this.subtitleStyle,
    this.hintText,
    this.hintTextStyle,
    this.validator,
    this.value,
    this.onTap,
    this.icon,
    this.isRequired = false,
  }) : super(key: key);

  final String? title;
  final TextStyle? titleStyle;
  final String? subtitle;
  final TextStyle? subtitleStyle;
  final String? hintText;
  final TextStyle? hintTextStyle;
  final String? Function(String?)? validator;
  final String? value;
  final VoidCallback? onTap;
  final IconData? icon;
  final bool isRequired;

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
        InkWell(
          onTap: () => onTap != null ? onTap!.call() : null,
          borderRadius: BorderRadius.circular(10),
          child: Container(
            padding: const EdgeInsets.symmetric(
              vertical: 14.0,
              horizontal: 10,
            ),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              border: Border.all(
                width: 1,
                color: DartdroidColor.greyLighten30,
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (value != null) ...[
                  Text(
                    value!,
                    style: DartDroidFonts.normal(
                      fontSize: 14,
                      color: DartdroidColor.black,
                    ),
                  ),
                ] else ...[
                  Text(
                    hintText ?? "00:00:00",
                    style: DartDroidFonts.normal(
                      fontSize: 14,
                      color: DartdroidColor.grey,
                    ),
                  )
                ],
                Icon(
                  icon,
                  color: DartdroidColor.grey,
                  size: 18.0,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
