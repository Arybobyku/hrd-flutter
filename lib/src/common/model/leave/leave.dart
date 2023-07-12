import 'package:hrd/src/common/common.dart';

class Leave extends BaseModel {
  final String? id;
  final String? userId;
  final String? startDate;
  final String? endDate;
  final String? approvalDate;
  final String? status;
  final String? reasons;
  final String? note;
  final String? type;
  final int? totalDays;
  final String? createdAt;
  final String? updatedAt;
  final TimeOffPolicy? timeOffPolicy;

  Leave({
    this.id,
    this.userId,
    this.startDate,
    this.endDate,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.approvalDate,
    this.note,
    this.type,
    this.reasons,
    this.timeOffPolicy,
    this.totalDays,
  });

  @override
  copyWith() {
    // TODO: implement copyWith
    throw UnimplementedError();
  }

  factory Leave.fromJsonApi(Map<String, dynamic> json) => Leave(
        id: json['id'],
        userId: json['user_id'],
        startDate: json['start_date'],
        endDate: json['end_date'],
        status: json['status'],
        approvalDate: json['approval_date'],
        note: json['note'],
        type: json['type'],
        createdAt: json['created_at'],
        updatedAt: json['updated_at'],
        reasons: json['reasons'],
        totalDays: json['total_days'],
        timeOffPolicy: json['time_off_policy'] != null
            ? TimeOffPolicy.fromJsonApi(json['time_off_policy'])
            : null,
      );

  @override
  List<Object?> get props => [
        id,
        userId,
        startDate,
        endDate,
        status,
        createdAt,
        updatedAt,
        approvalDate,
        note,
        reasons,
        type,
        timeOffPolicy,
        totalDays,
      ];
}
