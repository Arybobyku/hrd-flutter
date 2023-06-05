import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:hrd/src/base/base.dart';
import 'package:hrd/src/base/client/local_storage/base_local_storage_client.dart';
import 'package:hrd/src/common/common.dart';
import 'package:hrd/src/common/constant/share_pref_key.dart';
import 'package:hrd/src/core/core.dart';

class UserRepository implements BaseUserRepository {
  final BaseApiClient apiClient;
  final BaseLocalStorageClient localStorageClient;

  UserRepository({
    required this.apiClient,
    required this.localStorageClient,
  });

  @override
  Future<User?> getMe() async {
    Response response = await apiClient.get(
      Url.baseUrl + Url.me,
    );

    User? user;

    if (response.data['data'] != null) {
      user = BaseResponse<User>.fromJson(
        response.data,
        (json) => User.fromJsonAPI((json as Map<String, dynamic>)),
      ).data;
    }

    return user;
  }

  @override
  Future<void> saveMeToSharePref(User user) async {
    return await localStorageClient.saveByKey(
      jsonEncode(user.toJson()),
      SharedPrefKey.user,
      SharedPrefType.string,
    );
  }
}
