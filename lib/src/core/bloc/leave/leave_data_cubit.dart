import 'package:hrd/src/base/base.dart';
import 'package:hrd/src/common/common.dart';
import 'package:hrd/src/core/core.dart';

class LeaveDataCubit extends Cubit<BaseState<List<Leave>>> {
  final BaseLeaveRepository leaveRepository;

  LeaveDataCubit({required this.leaveRepository}) : super(const InitializedState());

  void initialize() async {
    try {
      emit(const LoadingState());

      List<Leave> leaves = await leaveRepository.getAllTimeOff();

      if (leaves.isEmpty) {
        return emit(const EmptyState());
      }
      return emit(
        LoadedState(
          data: leaves,
        ),
      );
    } catch (e) {
      return emit(
        ErrorState(error: e.toString()),
      );
    }
  }
}
