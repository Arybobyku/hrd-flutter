import 'package:flutter/material.dart';
import 'package:hrd/src/common/common.dart';
import 'package:intl/intl.dart';

class FormDateTimeWidget extends StatelessWidget {
  const FormDateTimeWidget({
    Key? key,
    required this.title,
    this.titleStyle,
    this.subtitle,
    this.subtitleStyle,
    this.isRequirement,
    this.hintText,
    this.hintTextStyle,
    this.validator,
    this.value,
    this.onTap,
    this.icon,
    this.isOnlyDate = false,
  }) : super(key: key);

  final String title;
  final TextStyle? titleStyle;
  final String? subtitle;
  final TextStyle? subtitleStyle;
  final bool? isRequirement;
  final String? hintText;
  final TextStyle? hintTextStyle;
  final String? Function(String?)? validator;
  final DateTime? value;
  final VoidCallback? onTap;
  final IconData? icon;
  final bool isOnlyDate;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          RichText(
            text: TextSpan(
              text: title,
              style: titleStyle ?? DartDroidFonts.bold(fontSize: 16),
              children: [
                if (isRequirement != null && isRequirement!) ...[
                  TextSpan(
                    text: ' *',
                    style: titleStyle?.copyWith(
                          color: DartdroidColor.redDarken40,
                        ) ??
                        DartDroidFonts.bold(
                          fontSize: 16,
                          color: DartdroidColor.grey,
                        ),
                  )
                ],
              ],
            ),
          ),
          if (subtitle != null) ...[
            Text(
              subtitle!,
              style: subtitleStyle ??
                  DartDroidFonts.bold(
                    fontSize: 12,
                    color: DartdroidColor.grey,
                  ),
            ),
          ],
          InkWell(
            onTap: () => onTap != null ? onTap!.call() : null,
            child: Container(
              padding: const EdgeInsets.symmetric(
                vertical: 18.0,
              ),
              decoration: BoxDecoration(
                  border: Border.all(
                width: 1.0,
                color: DartdroidColor.greyLighten60,
              )),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (value != null) ...[
                    if (isOnlyDate) ...[
                      Text(
                        DateFormat('yyyy-MM-dd').format(value!).toString(),
                        style: DartDroidFonts.normal(
                          fontSize: 16,
                          color: DartdroidColor.black,
                        ),
                      ),
                    ] else ...[
                      Text(
                        DateFormat('yyyy-MM-dd HH:mm')
                            .format(value!)
                            .toString(),
                        style: DartDroidFonts.normal(
                          fontSize: 16,
                          color: DartdroidColor.black,
                        ),
                      ),
                    ]
                  ] else ...[
                    Text(
                      hintText ?? "DD-MM-YYYY 00:00",
                      style: DartDroidFonts.normal(
                        fontSize: 16,
                        color: DartdroidColor.greyLighten30,
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
      ),
    );
  }
}
