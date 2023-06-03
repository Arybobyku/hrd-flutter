import 'package:hrd/src/base/base.dart';
import 'package:hrd/src/common/common.dart';
import 'package:hrd/src/common/extension/date_time_extension.dart';
import 'package:hrd/src/core/core.dart';

class AttendanceActionCubit extends Cubit<BaseState> {
  final BaseAttendanceRepository attendanceRepository;

  AttendanceActionCubit({
    required this.attendanceRepository,
  }) : super(InitializedState());

  void clockIn({required String? shiftId}) async {
    emit(LoadingState());

    try {
      String clockInTime = DateTime.now().generalFormatTime;
      String attendanceDate = DateTime.now().clockInFormat;

      Meta meta = await attendanceRepository.clockIn(
        Attendance(
          shiftId: shiftId,
          clockinTime: clockInTime,
          attendanceDate: attendanceDate,
        ),
      );

      if (meta.code.success) {
        return emit(SuccessState());
      } else {
        return  emit(ErrorState(error: meta.message));
      }
    } catch (e) {
      emit(ErrorState(error: e.toString()));
    }
  }

  void clockOut({required String? id}) async {
    emit(LoadingState());

    try {
      String clockOutTime = DateTime.now().generalFormatTime;

      Meta meta = await attendanceRepository.clockOut(
        Attendance(
          id: id,
          clockoutTime: clockOutTime,
        ),
      );
      if (meta.code.success) {
        emit(SuccessState());
      } else {
        emit(ErrorState(error: meta.message));
      }
    } catch (e) {
      emit(ErrorState(error: e.toString()));
    }
  }
}
