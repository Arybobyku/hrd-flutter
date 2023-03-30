import 'package:flutter_bloc/flutter_bloc.dart';

import '../client/logger/base_logger_client.dart';
import 'base_state.dart';

/// Main observer that observes all state changes.
class MainBlocObserver extends BlocObserver {
  final BaseLoggerClient? loggerClient;

  MainBlocObserver({this.loggerClient});

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);

    if (loggerClient != null && change.nextState is ErrorState) {
      loggerClient?.write(
        tag: 'Error',
        className: '${bloc.runtimeType}',
        message: (change.nextState as ErrorState).error,
        stackTrace: change.toString(),
        exception: (change.nextState as ErrorState).exception ??
            (change.nextState as ErrorState).error,
      );
    } else {
      print('${bloc.runtimeType} $change');
    }
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);

    if (loggerClient != null) {
      loggerClient?.write(
        tag: 'Error',
        className: '${bloc.runtimeType}',
        message: error.toString(),
        stackTrace: stackTrace.toString(),
        exception: error,
      );
    } else {
      print('${bloc.runtimeType} $error $stackTrace');
    }
  }
}
