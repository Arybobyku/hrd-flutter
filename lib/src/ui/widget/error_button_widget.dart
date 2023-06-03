import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hrd/src/common/common.dart';

class ErrorButtonWidget extends StatelessWidget with WidgetMixin {
  ErrorButtonWidget({
    Key? key,
    this.message = "ERROR",
    this.onTap,
  }) : super(key: key);
  final String message;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(Asset.iconError, height: 300),
             InkWell(
              onTap: onTap,
              child: const Icon(Icons.refresh),
            ),
            verticalSpace10,
            Text(
              message,
              textAlign: TextAlign.center,
              style: DartDroidFonts.bold(fontSize: 18),
            )
          ],
        ),
      ),
    );
  }
}
