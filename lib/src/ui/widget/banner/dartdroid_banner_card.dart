import 'package:flutter/material.dart';

class DartdroidBannerCard extends StatelessWidget {
  final Widget child;
  final String env;
  final String tag;

  const DartdroidBannerCard({
    Key? key,
    required this.env,
    required this.child,
    required this.tag,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (env == 'PROD' && tag == '') return child;

    return Banner(
      message: tag.isNotEmpty ? tag : env,
      location: BannerLocation.bottomStart,
      textDirection: TextDirection.rtl,
      layoutDirection: TextDirection.rtl,
      color: Colors.blueAccent,
      child: child,
    );
  }
}
