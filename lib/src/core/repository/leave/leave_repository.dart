import 'package:dio/dio.dart';
import 'package:hrd/src/base/base.dart';
import 'package:hrd/src/common/common.dart';
import 'package:hrd/src/common/mixin/date_mixin.dart';
import 'package:hrd/src/core/core.dart';

class LeaveRepository with DateMixin implements BaseLeaveRepository {
  final BaseApiClient apiClient;

  LeaveRepository({required this.apiClient});

  @override
  Future<List<Leave>> getAllTimeOff() async {
    Response response = await apiClient.get(Url.baseUrl + Url.timeOff);

    final listMap =
        BaseResponse<List>.fromJson(response.data, (json) => json as List).data;

    List<Leave> timeOff = [];

    for (Map data in listMap) {
      timeOff.add(
        Leave.fromJsonApi(
          Map<String, dynamic>.from(data),
        ),
      );
    }

    return timeOff;
  }

  @override
  Future<Meta> submitLeave(LeaveFormData leave) async {
    Response response = await apiClient.post(Url.baseUrl + Url.timeOff, data: {
      "start_date": parseDate(leave.startDate!),
      "end_date": parseDate(leave.endDate!),
      "reasons": leave.reasons,
    });

    final baseResponse = BaseResponse.fromJson(response.data, (json) => null);

    return baseResponse.meta;
  }
}
