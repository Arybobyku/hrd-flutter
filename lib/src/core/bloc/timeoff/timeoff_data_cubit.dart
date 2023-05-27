import 'package:hrd/src/base/base.dart';
import 'package:hrd/src/common/common.dart';
import 'package:hrd/src/core/core.dart';

class TimeOffDataCubit extends Cubit<BaseState<List<Leave>>> {
  final BaseLeaveRepository timeOffRepository;

  TimeOffDataCubit({
    required this.timeOffRepository,
  }) : super(InitializedState());

  void initialize() async {
    try {
      List<Leave> timeOffs = await timeOffRepository.getAllTimeOff();

      emit(
        LoadedState(
          data: timeOffs,
        ),
      );
    } catch (e) {
      emit(
        ErrorState(error: e.toString()),
      );
    }
  }
}
