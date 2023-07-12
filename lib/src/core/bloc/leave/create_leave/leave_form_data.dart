

import 'package:hrd/src/common/common.dart';

class LeaveFormData extends BaseModel {
  final String? leaveTypes;
  final DateTime? startDate;
  final DateTime? endDate;
  final String? reasons;
  final String? totalDays;

  LeaveFormData({
    this.leaveTypes,
    this.startDate,
    this.endDate,
    this.reasons,
    this.totalDays,
  });

  @override
  List<Object?> get props => [
    leaveTypes,
    startDate,
    endDate,
    reasons,
    totalDays,
  ];

  @override
  copyWith({
    String? leaveTypes,
    DateTime? startDate,
    DateTime? endDate,
    String? reasons,
    String? totalDays,
  }) =>
      LeaveFormData(
        leaveTypes: leaveTypes ?? this.leaveTypes,
        startDate: startDate ?? this.startDate,
        endDate: endDate ?? this.endDate,
        reasons: reasons ?? this.reasons,
        totalDays: totalDays ?? this.totalDays,
      );
}