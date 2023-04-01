import 'package:dio/dio.dart';
import 'package:hrd/src/base/base.dart';
import 'package:hrd/src/common/common.dart';

part 'authentication_repository.dart';

abstract class BaseAuthenticationRepository {
  /// Sign in using iSafe credentials
  Future<User?> signIn({
    required String userName,
    required String password,
  });

  Future<User?> signUp({
    required User user,
  });

  /// Reset password
  Future<User?> resetPassword({
    required String userName,
  });

  /// Set new password
  Future<void> setPassword({
    required String password,
    required String token,
  });

  /// Subscribe push notification to FCM
  Future subscribePushNotification({
    required String fcmToken,
    required String token,
  });

  /// Unsubscribe push notification to FCM
  Future unsubscribePushNotification({
    required String fcmToken,
    required String iSafeNo,
    required String token,
  });

  /// Get FCM token from firebase server
  Future<String?> getFcmTokenFromServer();

  /// Remove FCM token from firebase server
  Future<void> removeFcmTokenFromServer();

  Future<void> saveUserToLocalStorage(User user);

  Future<dynamic> getProfileFromLocalStorage();

  Future<void> resetLocalStorage();
}
