import 'package:hrd/src/base/base.dart';
import 'package:hrd/src/common/common.dart';
import 'package:hrd/src/core/core.dart';

class UserCubit extends Cubit<BaseState> {
  final BaseUserRepository userRepository;

  UserCubit({required this.userRepository}) : super(const InitializedState());

  Future<void> initialize() async {
    emit(const LoadingState());

    try {
      User? user = await userRepository.getMe();

      if (user != null) {
        await userRepository.saveMeToSharePref(user);

        emit(LoadedState(data: user));
      }

      emit(const EmptyState());
    } catch (e) {
      emit(ErrorState(error: e.toString()));
    }
  }
}
