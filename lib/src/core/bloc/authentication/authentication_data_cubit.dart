import 'package:clock/clock.dart';
import 'package:hrd/src/base/base.dart';

import '../../core.dart';

class AuthenticationDataCubit extends Cubit<BaseState> {
  final Clock clock;
  final BaseAuthenticationRepository authenticationRepository;

  AuthenticationDataCubit({
    required this.clock,
    required this.authenticationRepository,
  }) : super(InitializedState());

  void initialize() async {
    final user = await authenticationRepository.getUSerFromLocalStorage();

    if (user == null) {
      return emit(UnauthenticatedState());
    }

    emit(AuthenticatedState(data: user));
  }
}
