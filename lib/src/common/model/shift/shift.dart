import 'package:hrd/src/common/common.dart';

class Shift extends BaseModel {
  final String? id;
  final String? name;
  final String? schedulein;
  final String? scheduleout;
  final String? breakStart;
  final String? breakEnd;
  final int? clockinTolerance;
  final int? clockoutTolerance;

  Shift({
    this.id,
    this.name,
    this.schedulein,
    this.scheduleout,
    this.breakStart,
    this.breakEnd,
    this.clockinTolerance,
    this.clockoutTolerance,
  });

  factory Shift.fromJsonApi(Map<String, dynamic> json) => Shift(
        id: json['id'],
        name: json['name'],
        schedulein: json['schedulein'],
        scheduleout: json['scheduleout'],
        breakStart: json['break_start'],
        breakEnd: json['break_end'],
        clockinTolerance: json['clockin_tolerance'],
        clockoutTolerance: json['clockout_tolerance'],
      );

  factory Shift.fromJson(Map<String, dynamic> json) => Shift(
        id: json['id'],
        name: json['name'],
        schedulein: json['schedulein'],
        scheduleout: json['scheduleout'],
        breakStart: json['break_start'],
        breakEnd: json['break_end'],
        clockinTolerance: json['clockin_tolerance'],
        clockoutTolerance: json['clockout_tolerance'],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "schedulein": schedulein,
        "scheduleout": scheduleout,
        "break_start": breakStart,
        "break_end": breakEnd,
        "clockin_tolerance": clockinTolerance,
        "clockout_tolerance": clockoutTolerance,
      };

  @override
  copyWith({
    String? id,
    String? name,
    String? schedulein,
    String? scheduleout,
    String? breakStart,
    String? breakEnd,
    int? clockinTolerance,
    int? clockoutTolerance,
  }) =>
      Shift(
        id: id ?? this.id,
        name: name ?? this.name,
        schedulein: schedulein ?? this.schedulein,
        scheduleout: scheduleout ?? this.scheduleout,
        breakStart: breakStart ?? this.breakStart,
        breakEnd: breakEnd ?? this.breakEnd,
        clockinTolerance: clockinTolerance ?? this.clockinTolerance,
        clockoutTolerance: clockoutTolerance ?? this.clockoutTolerance,
      );

  @override
  List<Object?> get props => [
        id,
        name,
        schedulein,
        scheduleout,
        breakStart,
        breakEnd,
        clockinTolerance,
        clockoutTolerance,
      ];
}
