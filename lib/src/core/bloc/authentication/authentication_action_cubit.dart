import 'package:hrd/src/base/base.dart';
import 'package:hrd/src/common/common.dart';

import '../../core.dart';

class AuthenticationActionCubit extends Cubit<BaseState<AuthMeta>> {
  final BaseAuthenticationRepository authenticationRepository;

  AuthenticationActionCubit({
    required this.authenticationRepository,
  }) : super(InitializedState());

  //TODO: SIGN IN
  void signIn() {

  }

  //TODO: SIGN OUT
  void signOut() {}

  //TODO:  RESET PASSWORD
  void resetPassword() {}

  //TODO: SET PASSWORD
  void setPassword() {}
}
