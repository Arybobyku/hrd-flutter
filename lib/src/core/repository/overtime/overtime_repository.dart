import 'package:dio/dio.dart';
import 'package:hrd/src/base/base.dart';
import 'package:hrd/src/common/common.dart';
import 'package:hrd/src/core/bloc/bloc.dart';
import 'package:hrd/src/core/repository/overtime/base_overtime_repository.dart';

class OvertimeRepository implements BaseOvertimeRepository {
  final BaseApiClient apiClient;

  OvertimeRepository({
    required this.apiClient,
  });

  @override
  Future<List<Overtime>> getAllOvertime() async {
    Response response = await apiClient.get(Url.baseUrl + Url.overtime);

    final listMap =
        BaseResponse<List>.fromJson(response.data, (json) => json as List).data;

    List<Overtime> overtimes = [];

    for (Map data in listMap) {
      overtimes.add(
        Overtime.fromJsonApi(
          Map<String, dynamic>.from(data),
        ),
      );
    }

    return overtimes;
  }

  @override
  Future<Meta> submitOvertime(OvertimeFormData leave) {
    // TODO: implement submitOvertime
    throw UnimplementedError();
  }
}
