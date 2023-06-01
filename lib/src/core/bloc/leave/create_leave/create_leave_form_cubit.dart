import 'package:hrd/src/base/base.dart';
import 'package:hrd/src/common/common.dart';
import 'package:hrd/src/core/core.dart';

class CreateLeaveFormCubit extends Cubit<BaseState<LeaveFormData>> {
  final BaseLeaveRepository leaveRepository;

  CreateLeaveFormCubit({required this.leaveRepository})
      : super(InitializedState(data: LeaveFormData()));

  //TODO: BOBY
  // void updateFormLeaveTypes(LeaveFormData latestFormData, String value) {
  //   latestFormData = latestFormData.copyWith(leaveTypes: value);
  //   emit(LoadedState(data: latestFormData));
  // }

  void updateFormStartDate(LeaveFormData latestFormData, DateTime value) {
    latestFormData = latestFormData.copyWith(startDate: value);
    emit(LoadedState(data: latestFormData));
  }

  void updateFormReason(LeaveFormData latestFormData, String value) {
    latestFormData = latestFormData.copyWith(reasons: value);
    emit(LoadedState(data: latestFormData));
  }

  void updateFormEndData(LeaveFormData latestFormData, DateTime value) {
    latestFormData = latestFormData.copyWith(endDate: value);
    emit(LoadedState(data: latestFormData));
  }

  void submitFormLeave(LeaveFormData leave) async {
    emit(LoadingState(
      data: leave,
    ));

    try {
      Meta meta = await leaveRepository.submitLeave(leave);

      if (meta.code.success) {
        emit(
          SuccessState(
            data: leave,
          ),
        );
      } else {
        emit(ErrorState(error: meta.message));
      }
    } catch (e) {
      emit(
        ErrorState(
          data: leave,
          error: e.toString(),
        ),
      );
    }
  }
}
