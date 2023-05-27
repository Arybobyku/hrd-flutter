import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../common/common.dart';

class EmptyRefreshWidget extends StatelessWidget with WidgetMixin {
  EmptyRefreshWidget({Key? key, required this.onRefresh}) : super(key: key);

  final Future<void> Function() onRefresh;

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
                children: [
                  SvgPicture.asset(Asset.iconEmpty, height: 200),
                  verticalSpace20,
                  Text(
                    "Data Kosong",
                    style: DartDroidFonts.bold(fontSize: 26),
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
