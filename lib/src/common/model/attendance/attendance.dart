import 'package:hrd/src/common/common.dart';

class Attendance extends BaseModel {
  final String? id;
  final String? shiftId;
  final String? userId;
  final String? attendanceDate;
  final String? clockinTime;
  final String? clockoutTime;
  final String? status;
  final String? createdAt;
  final String? updatedAt;

  Attendance({
    this.id,
    this.shiftId,
    this.userId,
    this.attendanceDate,
    this.clockinTime,
    this.clockoutTime,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  factory Attendance.fromJsonApi(Map<String, dynamic> json) => Attendance(
        id: json['id'],
        userId: json['user_id'],
        shiftId: json['shift_id'],
        attendanceDate: json['attendance_date'],
        clockinTime: json['clockin_time'],
        clockoutTime: json['clockout_time'],
        status: json['status'],
        createdAt: json['created_at'],
        updatedAt: json['updated_at'],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "shift_id": shiftId,
        "attendance_date": attendanceDate,
        "clockin_time": clockinTime,
        "clockout_time": clockoutTime,
        "status": status,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };

  @override
  copyWith({
    String? id,
    String? shiftId,
    String? userId,
    String? attendanceDate,
    String? clockinTime,
    String? clockoutTime,
    String? status,
    String? createdAt,
    String? updatedAt,
  }) =>
      Attendance(
        id: id ?? this.id,
        shiftId: shiftId ?? this.shiftId,
        userId: userId ?? this.userId,
        attendanceDate: attendanceDate ?? this.attendanceDate,
        clockinTime: clockinTime ?? this.clockinTime,
        clockoutTime: clockoutTime ?? this.clockoutTime,
        status: status ?? this.status,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  @override
  List<Object?> get props => [
        id,
        shiftId,
        userId,
        attendanceDate,
        clockinTime,
        clockoutTime,
        status,
        createdAt,
        updatedAt,
      ];
}
