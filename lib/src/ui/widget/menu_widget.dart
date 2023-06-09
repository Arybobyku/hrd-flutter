import 'package:flutter/material.dart';

import '../../common/common.dart';

class MenuWidget extends StatelessWidget with WidgetMixin{
  final String icon;
  final String label;
  final Function()? onTap;

   MenuWidget({
    Key? key,
    required this.label,
    required this.icon,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: DartdroidColor.grey.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Image.asset(
              icon,
              height: 30,
              width: 30,
            ),
          ),
        ),
        verticalSpace(2),
        Text(
          label,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: DartDroidFonts.customFontWeight(
            fontWeight: FontWeight.w600,
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}
