import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User extends Equatable {
  @JsonKey(name: "id") final int? id;
  @JsonKey(name: "name") final String? name;
  @JsonKey(name: "email") final String? email;
  @JsonKey(name: "nip") final String? nip;
  @JsonKey(name: "role") final int? role;
  @JsonKey(name: "token") final int? token;

  const User({
    this.id,
    this.name,
    this.email,
    this.nip,
    this.role,
    this.token,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);

  @override
  List<Object?> get props => [
        id,
        name,
        email,
        nip,
        role,
      ];
}
