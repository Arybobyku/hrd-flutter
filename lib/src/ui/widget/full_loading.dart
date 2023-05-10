import 'package:flutter/material.dart';

import '../../common/utility/dartdroid_color.dart';

class FullLoading extends StatelessWidget {
  final Widget widget;
  final bool isLoading;

  const FullLoading({Key? key, required this.widget, required this.isLoading}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        widget,
        if(isLoading)
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: DartdroidColor.grey.withOpacity(0.5),
          ),
          alignment: Alignment.center,
          child: const CircularProgressIndicator(),
        )
      ],
    );
  }
}
