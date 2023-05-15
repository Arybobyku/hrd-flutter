import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:hrd/src/base/base.dart';
import 'package:hrd/src/base/client/local_storage/base_local_storage_client.dart';
import 'package:hrd/src/common/common.dart';
import 'package:hrd/src/common/constant/share_pref_key.dart';

part 'authentication_repository.dart';

abstract class BaseAuthenticationRepository {
  Future<User?> signIn({
    required String userName,
    required String password,
  });

  Future<User?> signUp({
    required User user,
  });

  Future signOut(String token);

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
    required String userID,
    required String token,
  });

  /// Get FCM token from firebase server
  Future<String?> getFcmTokenFromServer();

  /// Remove FCM token from firebase server
  Future<void> removeFcmTokenFromServer();

  Future<void> saveUserToLocalStorage(User user);

  Future<dynamic> getUSerFromLocalStorage();

  Future<void> resetLocalStorage();
}
