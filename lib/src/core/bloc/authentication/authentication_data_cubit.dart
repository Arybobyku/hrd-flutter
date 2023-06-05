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
  }) : super(const InitializedState());

  void initialize() async {
    String? rawUser;
    User? user;
    try {
      rawUser = await authenticationRepository.getUSerFromLocalStorage();
      if (rawUser != null) {
        user = User.fromJson(jsonDecode(rawUser));
      }

      if (user == null) {
        return emit(const UnauthenticatedState());
      }

      emit(AuthenticatedState(data: user));
    } catch (e) {
      emit(ErrorState(error: e.toString()));
    }
  }
}
