import 'package:hrd/src/common/common.dart';

class Overtime extends BaseModel {
  final String? id;
  final String? userId;
  final String? startTime;
  final int? totalHours;
  final String? startDate;
  final String? endDate;
  final String? approvalDate;
  final String? status;
  final String? note;
  final String? createdAt;
  final String? updatedAt;

  Overtime({
    this.id,
    this.startTime,
    this.totalHours,
    this.userId,
    this.startDate,
    this.endDate,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.approvalDate,
    this.note,
  });

  factory Overtime.fromJsonApi(Map<String, dynamic> json) => Overtime(
        id: json['id'],
        userId: json['user_id'],
        startTime: json['start_time'],
        totalHours: json['total_hours'],
        startDate: json['start_date'],
        endDate: json['end_date'],
        status: json['status'],
        approvalDate: json['approval_date'],
        note: json['note'],
        createdAt: json['created_at'],
        updatedAt: json['updated_at'],
      );

  @override
  copyWith() {
    // TODO: implement copyWith
    throw UnimplementedError();
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        startTime,
        totalHours,
        userId,
        startDate,
        endDate,
        status,
        createdAt,
        updatedAt,
        approvalDate,
        note,
      ];
}
