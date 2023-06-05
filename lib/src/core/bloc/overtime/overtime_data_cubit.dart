import 'package:hrd/src/base/base.dart';
import 'package:hrd/src/common/common.dart';
import 'package:hrd/src/core/core.dart';

class OvertimeDataCubit extends Cubit<BaseState> {
  final BaseOvertimeRepository overtimeRepository;

  OvertimeDataCubit({required this.overtimeRepository})
      : super(const InitializedState());

  void initialize() async {
    try {
      emit(const LoadingState());

      List<Overtime> overtimes = await overtimeRepository.getAllOvertime();

      if (overtimes.isEmpty) {
        return emit(const EmptyState());
      }
      return emit(
        LoadedState(
          data: overtimes,
        ),
      );
    } catch (e) {
      return emit(
        ErrorState(error: e.toString()),
      );
    }
  }
}
