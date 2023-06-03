import 'constant.dart';

class Url{
  // Base Url
  static const String baseUrl = EnvConfig.baseUrl;

  /// Authentication
  static const String login = '/login';
  static const String logout = '/logout';
  static const String timeOff = '/time-off';
  static const String overtime = '/overtime';
  static const String clockin = '/clockin';
  static const String clockout = '/clockout';
  static const String currentDayAttendance = '/currentDayAttendance';
  static const String attendance = '/attendance';
  static const String resetPassword = '/forgotPassword';
  static const String setPassword = '/changePassword';

}