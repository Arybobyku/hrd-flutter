import 'package:dio/dio.dart';
import 'package:hrd/src/base/base.dart';
import 'package:hrd/src/common/common.dart';
import 'package:hrd/src/common/mixin/date_mixin.dart';
import 'package:hrd/src/core/core.dart';

class AttendanceRepository with DateMixin implements BaseAttendanceRepository {
  final BaseApiClient apiClient;

  AttendanceRepository({
    required this.apiClient,
  });

  @override
  Future<Meta> clockIn(Attendance attendance) async {
    Response response = await apiClient.post(Url.baseUrl + Url.clockin, data: {
      "clockin_time": attendance.clockinTime,
      "shift_id": attendance.shiftId,
      "attendance_date": attendance.attendanceDate,
    });

    final baseResponse = BaseResponse.fromJson(response.data, (json) => null);

    return baseResponse.meta;
  }

  @override
  Future<Meta> clockOut(Attendance attendance) async {
    Response response = await apiClient.post(Url.baseUrl + Url.clockin, data: {
      "id": attendance.id,
      "clockout_time": attendance.clockoutTime,
    });

    final baseResponse = BaseResponse.fromJson(response.data, (json) => null);

    return baseResponse.meta;
  }

  @override
  Future<Attendance?> getCurrentDateAttendance() async {
    Response response =
        await apiClient.get(Url.baseUrl + Url.currentDayAttendance);

    Attendance? attendance = BaseResponse<Attendance?>.fromJson(response.data,
        (json) => Attendance.fromJsonApi(json as Map<String, dynamic>)).data;

    return attendance;
  }

  @override
  Future<List<Attendance>> getAll() async {
    Response response = await apiClient.get(Url.baseUrl + Url.attendance);

    final listMap =
        BaseResponse<List>.fromJson(response.data, (json) => json as List).data;

    List<Attendance> attendances = [];

    for (Map data in listMap) {
      attendances.add(
        Attendance.fromJsonApi(
          Map<String, dynamic>.from(data),
        ),
      );
    }

    return attendances;
  }
}
