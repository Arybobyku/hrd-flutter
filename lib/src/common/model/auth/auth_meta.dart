import 'package:hrd/src/common/common.dart';

class AuthMeta extends BaseModel {
  final User? user;
  final AuthMetaType type;
  final String? message;

  AuthMeta({
    this.user,
    required this.type,
    this.message,
  });

  @override
  copyWith({
    data,
    AuthMetaType? type,
    String? message,
  }) =>
      AuthMeta(
        user: data ?? user,
        type: type ?? this.type,
        message: message ?? this.message,
      );

  @override
  List<Object?> get props => [
        user,
        type,
        message,
      ];
}
