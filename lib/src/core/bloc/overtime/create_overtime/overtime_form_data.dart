import 'package:hrd/src/common/common.dart';

class OvertimeFormData extends BaseModel {
  final String? startTime;
  final DateTime? startDate;
  final DateTime? endDate;
  final int? totalHours;

  OvertimeFormData({
    this.startTime,
    this.startDate,
    this.endDate,
    this.totalHours,
  });

  @override
  copyWith({
    String? startTime,
    DateTime? startDate,
    DateTime? endDate,
    int? totalHours,
  }) =>
      OvertimeFormData(
        startDate: startDate ?? this.startDate,
        startTime: startTime ?? this.startTime,
        endDate: endDate ?? this.endDate,
        totalHours: totalHours ?? this.totalHours,
      );

  @override
  // TODO: implement props
  List<Object?> get props => [startTime, startDate, endDate, totalHours];
}
