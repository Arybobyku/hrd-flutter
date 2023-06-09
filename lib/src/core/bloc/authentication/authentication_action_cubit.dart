import 'package:hrd/src/base/base.dart';
import 'package:hrd/src/common/common.dart';

import '../../core.dart';

class AuthenticationActionCubit extends Cubit<BaseState<AuthMeta>> {
  final BaseAuthenticationRepository authenticationRepository;

  AuthenticationActionCubit({
    required this.authenticationRepository,
  }) : super(const InitializedState());

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

  void signOut(String? token) async {
    emit(
      LoadingState(
        data: AuthMeta(type: AuthMetaType.signOut),
      ),
    );

    try {
      if(token!=null){
        await authenticationRepository.signOut(token);
      }

      await authenticationRepository.resetLocalStorage();
    } catch (e) {
      emit(
        ErrorState(
          data: AuthMeta(type: AuthMetaType.signOut),
          error: e.toString(),
        ),
      );
    }

    emit(
      SuccessState(
        data: AuthMeta(type: AuthMetaType.signOut),
      ),
    );
  }
}
