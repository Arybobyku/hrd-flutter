import 'package:shared_preferences/shared_preferences.dart';

import 'base_local_storage_client.dart';

/// Shared preference client
class SharedPrefClient extends BaseLocalStorageClient {
  SharedPrefClient._();

  static final SharedPrefClient _instance = SharedPrefClient._();

  static SharedPrefClient get instance => _instance;

  SharedPreferences? _sharedPreferences;

  Future<SharedPreferences> get _client async {
    if (_sharedPreferences != null) {
      return _sharedPreferences!;
    }

    return _sharedPreferences = await SharedPreferences.getInstance();
  }

  @override
  Future getByKey(String key, SharedPrefType type) async {
    try {
      var data;
      SharedPreferences client = await _client;

      if (type == SharedPrefType.STRING) {
        data = client.getString(key);
      } else if (type == SharedPrefType.INT) {
        data = client.getInt(key);
      }

      return data;
    } catch (_) {
      return null;
    }
  }

  @override
  Future<void> saveByKey(data, String key, SharedPrefType type) async {
    SharedPreferences client = await _client;

    if (type == SharedPrefType.STRING) {
      await client.setString(key, data);
    } else if (type == SharedPrefType.INT) {
      await client.setInt(key, data);
    }

    return;
  }

  @override
  Future<bool> deleteByKey(String key) async {
    try {
      SharedPreferences client = await _client;
      client.remove(key);

      return true;
    } catch (_) {
      return false;
    }
  }

  @override
  Future<bool> clearAll() async {
    try {
      if (_sharedPreferences == null) {
        return false;
      }

      return await _sharedPreferences!.clear();
    } catch (e) {
      return false;
    }
  }
}