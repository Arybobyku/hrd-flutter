import 'dart:async';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:hrd/src/common/common.dart';

part 'connection_service.dart';

abstract class BaseConnectionService {
  Future<ConnectionStatus> lookup();

  Future<bool> canConnect();

  StreamSubscription<ConnectivityResult> Function(
    void Function(ConnectivityResult)?, {
    Function? onError,
    void Function()? onDone,
    bool? cancelOnError,
  }) get listen;
}
