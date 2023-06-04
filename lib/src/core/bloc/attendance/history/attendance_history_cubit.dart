import 'package:hrd/src/base/base.dart';
import 'package:hrd/src/common/common.dart';
import 'package:hrd/src/core/core.dart';

class AttendanceHistoryCubit extends Cubit<BaseState> {
  final BaseAttendanceRepository attendanceRepository;

  AttendanceHistoryCubit({
    required this.attendanceRepository,
  }) : super(InitializedState());

  void initialize() async {
    emit(LoadingState());
    try {
      List<Attendance> attendances = await attendanceRepository.getAll();

      if (attendances.isEmpty) {
        return emit(EmptyState());
      }

      emit(LoadedState(data: attendances));
    } catch (e) {
      emit(ErrorState(error: e.toString()));
    }
  }
}
