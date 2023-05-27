import 'package:hrd/src/common/common.dart';

class Leave extends BaseModel {
  final int? id;
  final int? userId;
  final String? startDate;
  final String? endDate;
  final String? approvalDate;
  final String? status;
  final String? reasons;
  final String? note;
  final String? createdAt;
  final String? updatedAt;

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
    this.reasons,
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
    createdAt: json['created_at'],
    updatedAt: json['updated_at'],
    reasons: json['reasons'],
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
  ];
}
