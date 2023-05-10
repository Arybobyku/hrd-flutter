import 'package:hrd/src/base/base.dart';
import 'package:hrd/src/common/common.dart';
import 'package:hrd/src/common/constant/string_constants.dart';

import '../../core.dart';

class AuthenticationActionCubit extends Cubit<BaseState<AuthMeta>> {
  final BaseAuthenticationRepository authenticationRepository;

  AuthenticationActionCubit({
    required this.authenticationRepository,
  }) : super(InitializedState());

  void signIn({
    required String userName,
    required String password,
  }) async {
    User? user;
    emit(
      LoadingState(
        data: AuthMeta(
          type: AuthMetaType.signIn,
        ),
      ),
    );

    try {
      user = await authenticationRepository.signIn(
        userName: userName,
        password: password,
      );
    } on BadAuthException {
      return emit(
        ErrorState(
          error: StringConstants.errorInvalidAuthMessage,
          data: AuthMeta(
            type: AuthMetaType.signIn,
          ),
        ),
      );
    } catch (e) {
      return emit(
        ErrorState(
          data: AuthMeta(
            type: AuthMetaType.signIn,
          ),
          error: StringConstants.errorMessage,
        ),
      );
    }

    if (user == null) {
      emit(
        ErrorState(
          error: StringConstants.errorMessage,
          data: AuthMeta(
            type: AuthMetaType.signIn,
          ),
        ),
      );
      return;
    }

    try {
      await authenticationRepository.saveUserToLocalStorage(user);
    } catch (e) {
      return emit(
        ErrorState(
          error: StringConstants.errorSaveLocalMessage,
          data: AuthMeta(
            type: AuthMetaType.signIn,
          ),
          exception: e,
        ),
      );
    }

    emit(SuccessState(data: AuthMeta(type: AuthMetaType.signIn)));
  }

  //TODO: SIGN OUT
  void signOut() {}
}
