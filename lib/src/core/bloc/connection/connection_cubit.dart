import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:hrd/src/base/base.dart';
import 'package:hrd/src/common/common.dart';
import 'package:hrd/src/core/core.dart';

part 'connection_state.dart';

class ConnectionCubit extends Cubit<ConnectionStatus> {
  final BaseConnectionService connectionService;

  ConnectionCubit({required this.connectionService})
      : super(ConnectionStatus.undefined);

  StreamSubscription? _subs;

  StreamSubscription? _connectSubs;

  Timer? _timer;

  @override
  Future<void> close() {
    _subs?.cancel();
    _connectSubs?.cancel();
    _timer?.cancel();
    return super.close();
  }

  void initialize() {
    _subs = connectionService.listen((status) {
      singleCheck();
    });
  }

  void singleCheck() async {
    final canConnect = await connectionService.canConnect();

    if (!canConnect) {
      emit(ConnectionStatus.offline);
    }

    final lookupResult = await connectionService.lookup();

    emit(lookupResult);
  }

  void periodicCheck({Duration duration = const Duration(seconds: 12)}) async {
    if (_timer != null) {
      debugPrint('WARNING : Has been already started. Terminating timer');

      _timer!.cancel();
      _timer = null;
    }

    _timer = Timer.periodic(duration, (timer) {
      singleCheck();
    });
  }
}
