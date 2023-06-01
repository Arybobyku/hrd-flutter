import 'package:hrd/src/common/common.dart';

class UserIdentity extends BaseModel {
  final String? id;
  final String? userId;
  final String? identityType;
  final String? identityNumber;
  final String? postalCode;
  final String? citizenIdAddress;
  final String? residentialAddress;

  UserIdentity({
    this.id,
    this.userId,
    this.citizenIdAddress,
    this.identityNumber,
    this.identityType,
    this.postalCode,
    this.residentialAddress,
  });

  factory UserIdentity.fromJsonApi(Map<String, dynamic> json) => UserIdentity(
        id: json['id'],
        userId: json['user_id'],
        citizenIdAddress: json['citizen_id_address'],
        identityNumber: json['identity_number'],
        identityType: json['identity_type'],
        postalCode: json['postal_code'],
        residentialAddress: json['residential_address'],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "citizen_id_address": citizenIdAddress,
        "identity_number": identityNumber,
        "identity_type": identityType,
        "postal_code": postalCode,
        "residential_address": residentialAddress,
      };

  @override
  copyWith({
    String? id,
    String? userId,
    String? identityType,
    String? identityNumber,
    String? postalCode,
    String? citizenIdAddress,
    String? residentialAddress,
  }) =>
      UserIdentity(
        id: id ?? this.id,
        userId: userId ?? this.userId,
        identityType: identityType ?? this.identityType,
        identityNumber: identityNumber ?? this.identityNumber,
        postalCode: postalCode ?? this.postalCode,
        citizenIdAddress: citizenIdAddress ?? this.citizenIdAddress,
        residentialAddress: residentialAddress ?? this.residentialAddress,
      );

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        userId,
        citizenIdAddress,
        identityNumber,
        identityType,
        postalCode,
        residentialAddress,
      ];
}
