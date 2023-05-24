import 'package:hrd/src/base/base.dart';
import 'package:hrd/src/common/common.dart';

class CreateLeaveFormCubit extends Cubit<BaseState<LeaveFormData>> {
  CreateLeaveFormCubit() : super(InitializedState(data: LeaveFormData()));

  void updateFormLeaveTypes(LeaveFormData latestFormData, String value) {
    latestFormData = latestFormData.copyWith(leaveTypes: value);
    emit(LoadedState(data: latestFormData));
  }

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

  void submitFormLeave() {}
}

class LeaveFormData extends BaseModel {
  String? leaveTypes;
  DateTime? startDate;
  DateTime? endDate;
  String? reasons;

  LeaveFormData({
    this.leaveTypes,
    this.startDate,
    this.endDate,
    this.reasons,
  });

  @override
  List<Object?> get props => [
        leaveTypes,
        startDate,
        endDate,
        reasons,
      ];

  @override
  copyWith({
    String? leaveTypes,
    DateTime? startDate,
    DateTime? endDate,
    String? reasons,
  }) =>
      LeaveFormData(
        leaveTypes: leaveTypes ?? this.leaveTypes,
        startDate: startDate ?? this.startDate,
        endDate: endDate ?? this.endDate,
        reasons: reasons ?? this.reasons,
      );
}
