import 'dart:convert';

import 'package:hrd/src/common/common.dart';

class User extends BaseModel {
  final String? id;
  final int? role;
  final String? firstName;
  final String? lastname;
  final String? email;
  final String? mobilePhone;
  final String? martialStatus;
  final String? bloodType;
  final String? religion;
  final String? accessToken;
  final String? tokenType;
  final UserIdentity? userIdentity;
  final Employee? employee;
  final UserShift? userShift;

  User({
    this.id,
    this.role,
    this.email,
    this.accessToken,
    this.bloodType,
    this.firstName,
    this.lastname,
    this.martialStatus,
    this.mobilePhone,
    this.religion,
    this.tokenType,
    this.userIdentity,
    this.employee,
    this.userShift,
  });

  factory User.fromJsonAPI(Map<String, dynamic> json) => User(
        id: json['id'],
        role: json['role'],
        email: json['email'],
        firstName: json['first_name'],
        lastname: json['last_name'],
        mobilePhone: json['mobile_phone'],
        martialStatus: json['martial_status'],
        religion: json['religion'],
        bloodType: json['blood_type'],
        userIdentity: json['user_identity'] != null
            ? UserIdentity.fromJsonApi(json['user_identity'])
            : null,
        employee: json['employee'] != null
            ? Employee.fromJsonApi(json['employee'])
            : null,
        userShift: json['user_shift'] != null
            ? UserShift.fromJsonApi(json['user_shift'])
            : null,
      );

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json['id'],
        role: json['role'],
        email: json['email'],
        firstName: json['first_name'],
        lastname: json['last_name'],
        mobilePhone: json['mobile_phone'],
        martialStatus: json['martial_status'],
        religion: json['religion'],
        bloodType: json['blood_type'],
        accessToken: json['access-token'],
        tokenType: json['token-type'],
        userIdentity: json['user_identity'] != null
            ? UserIdentity.fromJsonApi(jsonDecode(json['user_identity']))
            : null,
        employee: json['employee'] != null
            ? Employee.fromJson(jsonDecode(json['employee']))
            : null,
        userShift: json['user_shift'] != null
            ? UserShift.fromJson(jsonDecode(json['user_shift']))
            : null,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "role": role,
        "email": email,
        "access-token": accessToken,
        "blood_type": bloodType,
        "first_name": firstName,
        "last_name": lastname,
        "martial_status": martialStatus,
        "mobile_phone": mobilePhone,
        "religion": religion,
        "token-type": tokenType,
        "user_identity":
            userIdentity != null ? jsonEncode(userIdentity!.toJson()) : null,
        "employee": employee != null ? jsonEncode(employee!.toJson()) : null,
        "user_shift":
            userShift != null ? jsonEncode(userShift!.toJson()) : null,
      };

  @override
  copyWith({
    String? id,
    int? role,
    String? firstName,
    String? lastname,
    String? email,
    String? mobilePhone,
    String? martialStatus,
    String? bloodType,
    String? religion,
    String? accessToken,
    String? tokenType,
    UserIdentity? userIdentity,
    Employee? employee,
    UserShift? userShift,
  }) =>
      User(
        id: id ?? this.id,
        role: role ?? this.role,
        firstName: firstName ?? this.firstName,
        lastname: lastname ?? this.lastname,
        email: email ?? this.email,
        mobilePhone: mobilePhone ?? this.mobilePhone,
        martialStatus: martialStatus ?? this.martialStatus,
        bloodType: bloodType ?? this.bloodType,
        religion: religion ?? this.religion,
        accessToken: accessToken ?? this.accessToken,
        tokenType: tokenType ?? this.tokenType,
        userIdentity: userIdentity ?? this.userIdentity,
        employee: employee ?? this.employee,
        userShift: userShift ?? this.userShift,
      );

  @override
  List<Object?> get props => [
        id,
        role,
        email,
        accessToken,
        bloodType,
        firstName,
        lastname,
        martialStatus,
        mobilePhone,
        religion,
        tokenType,
        userIdentity,
      ];
}
