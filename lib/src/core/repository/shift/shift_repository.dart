import 'package:dio/dio.dart';
import 'package:hrd/src/base/base.dart';
import 'package:hrd/src/common/common.dart';
import 'package:hrd/src/core/core.dart';

class ShiftRepository implements BaseShiftRepository {
  final BaseApiClient apiClient;

  ShiftRepository({
    required this.apiClient,
  });

  @override
  Future<List<Shift>> getAll() async {
    Response response = await apiClient.get(Url.baseUrl + Url.shift);

    final listMap =
        BaseResponse<List>.fromJson(response.data, (json) => json as List).data;

    List<Shift> shifts = [];

    for (Map data in listMap) {
      shifts.add(
        Shift.fromJsonApi(
          Map<String, dynamic>.from(data),
        ),
      );
    }

    return shifts;
  }
}
