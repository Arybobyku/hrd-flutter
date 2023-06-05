import 'package:hrd/src/base/base.dart';
import 'package:hrd/src/common/common.dart';
import 'package:hrd/src/core/core.dart';

class AttendanceDataCubit extends Cubit<BaseState<Attendance?>> {
  final BaseAttendanceRepository attendanceRepository;

  AttendanceDataCubit({
    required this.attendanceRepository,
  }) : super(const InitializedState());

  void initialize() async {
    emit(const LoadingState());
    try {
      Attendance? attendance =
          await attendanceRepository.getCurrentDateAttendance();

      emit(LoadedState(data: attendance));
    } catch (e) {
      emit(
        ErrorState(error: e.toString()),
      );
    }
  }
}
