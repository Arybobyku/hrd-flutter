import 'dart:convert';

import 'package:hrd/src/common/common.dart';

class Employee extends BaseModel {
  final String? id;
  final String? userId;
  final String? branchId;
  final String? departmentId;
  final String? positionId;
  final String? employmentStatus;
  final String? joinDate;
  final String? resignDate;
  final OrganizationHierarchy? branch;
  final OrganizationHierarchy? department;
  final OrganizationHierarchy? position;

  Employee({
    this.id,
    this.userId,
    this.branchId,
    this.departmentId,
    this.positionId,
    this.employmentStatus,
    this.joinDate,
    this.resignDate,
    this.branch,
    this.position,
    this.department,
  });

  factory Employee.fromJsonApi(Map<String, dynamic> json) => Employee(
        id: json['id'],
        userId: json['user_id'],
        branchId: json['branch_id'],
        departmentId: json['department_id'],
        positionId: json['position_id'],
        employmentStatus: json['employment_status'],
        joinDate: json['join_date'],
        resignDate: json['resign_date'],
        branch: json['branch'] != null
            ? OrganizationHierarchy.fromJsonApi(
                json['branch'],
              )
            : null,
        department: json['department'] != null
            ? OrganizationHierarchy.fromJsonApi(
                json['department'],
              )
            : null,
        position: json['position'] != null
            ? OrganizationHierarchy.fromJsonApi(
                json['position'],
              )
            : null,
      );

  factory Employee.fromJson(Map<String, dynamic> json) => Employee(
        id: json['id'],
        userId: json['user_id'],
        branchId: json['branch_id'],
        departmentId: json['department_id'],
        positionId: json['position_id'],
        employmentStatus: json['employment_status'],
        joinDate: json['join_date'],
        resignDate: json['resign_date'],
        branch: json['branch'] != null
            ? OrganizationHierarchy.fromJsonApi(
                jsonDecode(json['branch']),
              )
            : null,
        department: json['department'] != null
            ? OrganizationHierarchy.fromJsonApi(
                jsonDecode(json['department']),
              )
            : null,
        position: json['position'] != null
            ? OrganizationHierarchy.fromJsonApi(
                jsonDecode(json['position']),
              )
            : null,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "branch_id": branchId,
        "department_id": departmentId,
        "position_id": positionId,
        "employment_status": employmentStatus,
        "join_date": joinDate,
        "resign_date": resignDate,
        "branch": branch != null ? jsonEncode(branch!.toJson()) : null,
        "department":
            department != null ? jsonEncode(department!.toJson()) : null,
        "position": position != null ? jsonEncode(position!.toJson()) : null,
      };

  @override
  copyWith({
    String? id,
    String? userId,
    String? branchId,
    String? departmentId,
    String? positionId,
    String? employmentStatus,
    String? joinDate,
    String? resignDate,
    OrganizationHierarchy? branch,
    OrganizationHierarchy? department,
    OrganizationHierarchy? position,
  }) =>
      Employee(
        id: id ?? this.id,
        userId: userId ?? this.userId,
        branchId: branchId ?? this.branchId,
        departmentId: departmentId ?? this.departmentId,
        positionId: positionId ?? this.positionId,
        employmentStatus: employmentStatus ?? this.employmentStatus,
        joinDate: joinDate ?? this.joinDate,
        resignDate: resignDate ?? this.resignDate,
        branch: branch ?? this.branch,
        position: position ?? this.position,
        department: department ?? this.department,
      );

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        userId,
        branchId,
        departmentId,
        positionId,
        employmentStatus,
        joinDate,
        resignDate,
        branch,
        position,
        department,
      ];
}
