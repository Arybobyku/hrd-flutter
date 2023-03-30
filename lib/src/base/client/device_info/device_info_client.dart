part of 'base_device_info_client.dart';

class DeviceInfo implements BaseDeviceInfoClient {
  DeviceInfo._createInstance();

  static final _instance = DeviceInfo._createInstance();

  static get instance => _instance;

  late AndroidDeviceInfo? _androidDeviceInfo;
  late IosDeviceInfo? _iosDeviceInfo;
  DeviceInfoPlugin? _deviceInfo;

  @override
  AndroidDeviceInfo? get androidInfo => _androidDeviceInfo;

  @override
  String? get deviceName => _androidDeviceInfo?.device;

  @override
  Future initialize() async {
    _deviceInfo = DeviceInfoPlugin();

    if (isAndroid) {
      try {
        _androidDeviceInfo = await _deviceInfo!.androidInfo;
      } catch (e) {
        print(e);
      }
    } else if (isIos) {
      try {
        _iosDeviceInfo = await _deviceInfo!.iosInfo;
      } catch (e) {
        print(e);
      }
      _iosDeviceInfo = await _deviceInfo!.iosInfo;
    }
  }

  @override
  IosDeviceInfo? get iosInfo => _iosDeviceInfo;

  @override
  bool get isAndroid => Platform.isAndroid;

  @override
  bool get isIos => Platform.isIOS;
}
