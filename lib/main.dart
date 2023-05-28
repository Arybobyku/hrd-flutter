import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hrd/src/app.dart';
import 'package:hrd/src/base/base.dart';
import 'package:hrd/src/base/client/local_storage/base_local_storage_client.dart';
import 'package:hrd/src/base/client/local_storage/local_storage_client.dart';
import 'package:hrd/src/common/common.dart';
import 'package:hrd/src/core/core.dart';
import 'package:hrd/src/ui/widget/banner/dartdroid_banner_card.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final Connectivity connectivity = Connectivity();

  final BaseLocalStorageClient localStorageClient = SharedPrefClient.instance;

  final BaseApiClient apiClient = DioClient(
    // alice: EnvConfig.env != 'PROD' ? _alice : null,
    msTimeout: EnvConfig.defaultMsTimeout,
    localStorageClient: localStorageClient,
  );

  final BaseLoggerClient loggerClient = LoggerClient();

  // Service
  final BaseConnectionService connectionService = ConnectionService(
    connectivity: connectivity,
  );

  // Repository
  final BaseAuthenticationRepository authenticationRepository =
      AuthenticationRepository(
    apiClient: apiClient,
    localStorageClient: localStorageClient,
  );

  final BaseLeaveRepository leaveRepository = LeaveRepository(
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

  Bloc.observer = MainBlocObserver(
    loggerClient: loggerClient,
  );

  runApp(
    DartdroidBannerCard(
      env: EnvConfig.env,
      tag: EnvConfig.envTag,
      child: App(
        connectivity: connectivity,
        connectionService: connectionService,
        authenticationRepository: authenticationRepository,
        leaveRepository: leaveRepository,
      ),
    ),
  );
}
