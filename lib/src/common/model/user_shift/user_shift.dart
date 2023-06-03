import 'dart:convert';

import 'package:hrd/src/common/common.dart';

class UserShift extends BaseModel {
  final String? id;
  final String? userId;
  final String? shiftId;
  final Shift? shift;

  UserShift({
    this.id,
    this.userId,
    this.shiftId,
    this.shift,
  });

  factory UserShift.fromJsonApi(Map<String, dynamic> json) => UserShift(
        id: json['id'],
        userId: json['user_id'],
        shiftId: json['shift_id'],
        shift: json['shift'] != null ? Shift.fromJsonApi(json['shift']) : null,
      );

  factory UserShift.fromJson(Map<String, dynamic> json) => UserShift(
        id: json['id'],
        userId: json['user_id'],
        shiftId: json['shift_id'],
        shift: json['shift'] != null
            ? Shift.fromJson(jsonDecode(json['shift']))
            : null,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "shift_id": shiftId,
        "shift": shift != null ? jsonEncode(shift!.toJson()) : null,
      };

  @override
  copyWith({
    String? id,
    String? userId,
    String? shiftId,
    Shift? shift,
  }) =>
      UserShift(
        id: id ?? this.id,
        userId: userId ?? this.userId,
        shiftId: shiftId ?? this.shiftId,
        shift: shift ?? this.shift,
      );

  @override
  List<Object?> get props => [
        id,
        userId,
        shiftId,
        shift,
      ];
}
