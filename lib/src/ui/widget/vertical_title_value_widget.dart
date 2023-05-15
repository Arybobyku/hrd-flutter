import 'package:flutter/material.dart';

import '../../common/common.dart';

class VerticalTitleValueWidget extends StatelessWidget {
  final String title;
  final String value;

  const VerticalTitleValueWidget({
    Key? key,
    required this.title,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: DartDroidFonts.customFontWeight(
            fontWeight: FontWeight.w600,
          ),
        ),
        Text(
          value,
          style: DartDroidFonts.normal(),
        ),
      ],
    );
  }
}
