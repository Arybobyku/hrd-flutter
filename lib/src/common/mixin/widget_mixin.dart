import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hrd/src/ui/ui.dart';

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


  showSuccessDialog(BuildContext context,{required String description, Function()? onTap}){
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              Asset.iconSuccess,
              height: 100,
              width: 100,
            ),
            verticalSpace15,
            Text(
              "Berhasil",
              style: DartDroidFonts.bold(
                  fontSize: 30,
                  color:
                  DartdroidColor.primary),
            ),
            Text(
              description,
              style: DartDroidFonts.normal(
                  fontSize: 14),
            ),
            verticalSpace20,
            ButtonRounded(text: "Kembali",onPressed: onTap,),
          ],
        ),
      ),
    );
  }
}
