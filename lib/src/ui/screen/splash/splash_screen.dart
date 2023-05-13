import 'package:flutter/material.dart';
import 'package:hrd/src/common/utility/dartdroid_color.dart';
import 'package:hrd/src/common/utility/dartdroid_path.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DartdroidColor.primary,
      body: SizedBox(
        height: double.infinity,
        child: Image.asset(DartdroidPath.logo),
      ),
    );
  }
}
