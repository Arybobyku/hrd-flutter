import 'package:hrd/src/base/base.dart';

class DartdroidBlocObserver extends MainBlocObserver {
  final BaseUnAuthentication baseErrorState;

  DartdroidBlocObserver({
    BaseLoggerClient? loggerClient,
    required this.baseErrorState,
  }) : super(loggerClient: loggerClient);

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);

    if (change.nextState is ErrorState &&
        (change.nextState as ErrorState).error.contains('Unauthenticated')) {
      baseErrorState.unAuthentication();
    }
  }
}

abstract class BaseUnAuthentication {
  void unAuthentication();
}
