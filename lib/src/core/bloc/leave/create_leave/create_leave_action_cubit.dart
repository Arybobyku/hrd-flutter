import 'package:hrd/src/base/bloc/bloc.dart';
import 'package:hrd/src/common/common.dart';
import 'package:hrd/src/core/repository/timeoffPolicy/base_timeoff_policy_repository.dart';

class CreateLeaveActionCubit extends Cubit<BaseState> {
  final BaseTimeOffPolicyRepository timeOffPolicyRepository;

  CreateLeaveActionCubit({required this.timeOffPolicyRepository})
      : super(const InitializedState());

  void initialize() async {
    try {
      emit(const LoadingState());

      List<TimeOffPolicy> policies = await timeOffPolicyRepository.getAll();

      if (policies.isEmpty) {
        return emit(const EmptyState());
      }
      return emit(
        LoadedState(
          data: policies,
        ),
      );
    } catch (e) {
      return emit(
        ErrorState(error: e.toString()),
      );
    }
  }
}
