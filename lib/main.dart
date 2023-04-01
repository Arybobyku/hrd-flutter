import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hrd/src/app.dart';
import 'package:hrd/src/base/base.dart';
import 'package:hrd/src/common/common.dart';
import 'package:hrd/src/core/core.dart';
import 'package:hrd/src/ui/widget/banner/dartdroid_banner_card.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //TODO:
  // Bloc.observer = MainBlocObserver(loggerClient: _loggerClient);

  final Connectivity connectivity = Connectivity();

  final BaseApiClient apiClient = DioClient(
    // alice: EnvConfig.env != 'PROD' ? _alice : null,
    msTimeout: EnvConfig.defaultMsTimeout,
  );

  // Service
  final BaseConnectionService connectionService = ConnectionService(
    connectivity: connectivity,
  );

  // Repository
  final BaseAuthenticationRepository authenticationRepository =
      AuthenticationRepository(
    apiClient: apiClient,
  );

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
        connectivity: connectivity,
        connectionService: connectionService,
        authenticationRepository: authenticationRepository,
      ),
    ),
  );
}
