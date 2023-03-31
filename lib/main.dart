import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hrd/src/app.dart';
import 'package:hrd/src/common/common.dart';
import 'package:hrd/src/ui/widget/banner/dartdroid_banner_card.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //TODO:
  // Bloc.observer = MainBlocObserver(loggerClient: _loggerClient);

  final Connectivity _connectivity = Connectivity();

  // Disable Landscape Mode
  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
  );

  // Set Status Bar to Light
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle.light,
  );

  runApp(
    DartdroidBannerCard(
      env: EnvConfig.env,
      tag: EnvConfig.envTag,
      child: App(
        connectivity: _connectivity,
      ),
    ),
  );
}
