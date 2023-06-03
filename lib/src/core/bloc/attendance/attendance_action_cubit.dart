import 'package:hrd/src/base/base.dart';
import 'package:hrd/src/common/common.dart';
import 'package:hrd/src/core/core.dart';

class AttendanceActionCubit extends Cubit<BaseState> {
  final BaseAttendanceRepository attendanceRepository;

  AttendanceActionCubit({
    required this.attendanceRepository,
  }) : super(InitializedState());

  void clockIn(Attendance attendance) async {
    emit(LoadedState());
    try {
      Meta meta = await attendanceRepository.clockIn(attendance);
      if (meta.code.success) {
        emit(
          SuccessState(),
        );
      } else {
        emit(ErrorState(error: meta.message));
      }
    } catch (e) {
      emit(ErrorState(error: e.toString()));
    }
  }

  void clockOut(Attendance attendance) async {
    emit(LoadedState());
    try {
      Meta meta = await attendanceRepository.clockIn(attendance);
      if (meta.code.success) {
        emit(
          SuccessState(),
        );
      } else {
        emit(ErrorState(error: meta.message));
      }
    } catch (e) {
      emit(ErrorState(error: e.toString()));
    }
  }
}
