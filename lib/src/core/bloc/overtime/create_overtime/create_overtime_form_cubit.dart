import 'package:hrd/src/base/base.dart';
import 'package:hrd/src/common/common.dart';
import 'package:hrd/src/core/core.dart';

class CreateOvertimeFormCubit extends Cubit<BaseState> {
  final BaseOvertimeRepository overtimeRepository;

  CreateOvertimeFormCubit({
    required this.overtimeRepository,
  }) : super(InitializedState());

  void updateFormStartDate(OvertimeFormData latestFormData, DateTime value) {
    latestFormData = latestFormData.copyWith(startDate: value);
    emit(LoadedState(data: latestFormData));
  }

  void updateFormStartTime(OvertimeFormData latestFormData, String value) {
    latestFormData = latestFormData.copyWith(startTime: value);
    emit(LoadedState(data: latestFormData));
  }

  void updateFormEndDate(OvertimeFormData latestFormData, DateTime value) {
    latestFormData = latestFormData.copyWith(endDate: value);
    emit(LoadedState(data: latestFormData));
  }

  void updateFormTotalHours(OvertimeFormData latestFormData, int value) {
    latestFormData = latestFormData.copyWith(totalHours: value);
    emit(LoadedState(data: latestFormData));
  }

  void submitFormLeave(OvertimeFormData overtime) async {
    emit(LoadingState(
      data: overtime,
    ));

    try {
      Meta meta = await overtimeRepository.submitOvertime(overtime);

      if (meta.code.success) {
        emit(
          SuccessState(
            data: overtime,
          ),
        );
      } else {
        emit(ErrorState(error: meta.message));
      }
    } catch (e) {
      emit(
        ErrorState(
          data: overtime,
          error: e.toString(),
        ),
      );
    }
  }
}
