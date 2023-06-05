import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';

part 'connection_service.dart';

abstract class BaseConnectionService {

  Future<bool> canConnect();

  StreamSubscription<ConnectivityResult> Function(
    void Function(ConnectivityResult)?, {
    Function? onError,
    void Function()? onDone,
    bool? cancelOnError,
  }) get listen;
}
