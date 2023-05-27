import 'package:flutter/material.dart';
import 'package:hrd/src/common/common.dart';

class TitleValueWidget extends StatelessWidget with WidgetMixin {
  TitleValueWidget({Key? key, required this.title, required this.value})
      : super(key: key);

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        verticalSpace10,
        Text(title, style: DartDroidFonts.bold(fontSize: 14)),
        Text(
          value,
          style: DartDroidFonts.normal(fontSize: 16),
        ),
      ],
    );
  }
}
