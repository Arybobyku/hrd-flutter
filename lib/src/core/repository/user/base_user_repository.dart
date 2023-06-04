import 'package:hrd/src/common/common.dart';

abstract class BaseUserRepository {
  Future<User?> getMe();

  Future<void> saveMeToSharePref(User user);
}
