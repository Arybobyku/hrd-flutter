import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../common.dart';

mixin WidgetMixin {
  final Widget verticalSpace5 = const SizedBox(height: 5);
  final Widget verticalSpace10 = const SizedBox(height: 10);
  final Widget verticalSpace15 = const SizedBox(height: 15);
  final Widget verticalSpace20 = const SizedBox(height: 20);

  Widget verticalSpace(double height) => SizedBox(height: height);

  final Widget horizontalSpace5 = const SizedBox(width: 5);
  final Widget horizontalSpace10 = const SizedBox(width: 10);
  final Widget horizontalSpace15 = const SizedBox(width: 15);
  final Widget horizontalSpace20 = const SizedBox(width: 20);

  Widget horizontalSpace(double width) => SizedBox(width: width);

  Widget divider({
    double height = 1,
    Color color = DartdroidColor.greyLighten30,
    double marginVertical = 12,
  }) =>
      Column(
        children: [
          verticalSpace(marginVertical),
          Divider(
            height: height,
            color: color,
          ),
          verticalSpace(marginVertical),
        ],
      );
}
