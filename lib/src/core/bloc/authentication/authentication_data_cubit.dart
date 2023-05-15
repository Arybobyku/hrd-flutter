import 'dart:convert';

import 'package:clock/clock.dart';
import 'package:hrd/src/base/base.dart';
import 'package:hrd/src/common/common.dart';

import '../../core.dart';

class AuthenticationDataCubit extends Cubit<BaseState> {
  final Clock clock;
  final BaseAuthenticationRepository authenticationRepository;

  AuthenticationDataCubit({
    required this.clock,
    required this.authenticationRepository,
  }) : super(InitializedState());

  void initialize() async {
    String? rawUser;
    User? user;

    rawUser = await authenticationRepository.getUSerFromLocalStorage();
    if (rawUser != null) {
      user = User.fromJson(jsonDecode(rawUser));
    }

    if (user == null) {
      return emit(UnauthenticatedState());
    }

    print("CALLED");

    emit(AuthenticatedState(data: user));
  }
}
