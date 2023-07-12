import 'package:hrd/src/common/common.dart';

class TimeOffPolicy extends BaseModel {
  final String? id;
  final String? name;
  final String? description;
  final int? maxDayPerYear;

  TimeOffPolicy({
    this.id,
    this.name,
    this.description,
    this.maxDayPerYear,
  });

  factory TimeOffPolicy.fromJsonApi(Map<String, dynamic> json) => TimeOffPolicy(
        id: json['id'],
        name: json['name'],
        description: json['description'],
        maxDayPerYear: json['max_day_per_year'],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "max_day_per_year": maxDayPerYear,
      };

  @override
  copyWith({
    String? id,
    String? name,
    String? description,
    int? maxDayPerYear,
  }) =>
      TimeOffPolicy(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description ?? this.description,
        maxDayPerYear: maxDayPerYear ?? this.maxDayPerYear,
      );

  @override
  List<Object?> get props => [
        id,
        name,
        description,
        maxDayPerYear,
      ];
}
