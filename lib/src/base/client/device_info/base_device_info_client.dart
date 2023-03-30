import 'dart:io' show Platform;

import 'package:device_info_plus/device_info_plus.dart';

part 'device_info_client.dart';

abstract class BaseDeviceInfoClient {
  Future initialize();

  AndroidDeviceInfo? get androidInfo;
  bool get isAndroid;

  IosDeviceInfo? get iosInfo;
  bool get isIos;

  String? get deviceName;
}
