import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hrd/src/common/common.dart';

class ErrorRefreshWidget extends StatelessWidget with WidgetMixin {
  ErrorRefreshWidget({Key? key, required this.onRefresh, this.message = "ERROR"}) : super(key: key);

  final Future<void> Function() onRefresh;

  final String message;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: onRefresh,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(Asset.iconError, height: 300),
                  verticalSpace20,
                  Text(
                    message,
                    textAlign: TextAlign.center,
                    style: DartDroidFonts.bold(fontSize: 18),
                  )
                ],
              ),
            ),
          ),
          ListView(),
        ],
      ),
    );
  }
}
