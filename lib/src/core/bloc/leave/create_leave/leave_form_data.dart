

import 'package:hrd/src/common/common.dart';

class LeaveFormData extends BaseModel {
  final String? leaveTypes;
  final DateTime? startDate;
  final DateTime? endDate;
  final String? reasons;

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