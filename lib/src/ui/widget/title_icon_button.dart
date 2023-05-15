import 'package:flutter/material.dart';

import '../../common/common.dart';

class TitleIconButton extends StatelessWidget {
  final String title;
  final IconData iconData;
  final Function()? onTap;

  const TitleIconButton({
    Key? key,
    required this.title,
    required this.iconData,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: DartDroidFonts.normal(fontSize: 14),
            ),
          ),
          Icon(
            iconData,
            color: DartdroidColor.grey,
          ),
        ],
      ),
    );
  }
}
