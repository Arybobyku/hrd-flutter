import 'package:hrd/src/base/base.dart';

class AuthenticatedState<User> extends BaseState<User> {
  AuthenticatedState({
    DateTime? timestamp,
    User? data,
  }) : super(
    timestamp: timestamp,
    data: data,
  );

  @override
  String toString() {
    return 'AuthenticatedState { timestamp: $timestamp, data: $data}';
  }
}

class UnauthenticatedState<T> extends BaseState<T> {
  final String? message;

  UnauthenticatedState({
    DateTime? timestamp,
    T? data,
    this.message,
  }) : super(
    timestamp: timestamp,
    data: data,
  );

  @override
  String toString() {
    return 'UnauthenticatedState { timestamp: $timestamp, data: $data, message: $message }';
  }
}
