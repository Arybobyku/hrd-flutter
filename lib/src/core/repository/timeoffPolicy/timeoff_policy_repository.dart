import 'package:dio/dio.dart';
import 'package:hrd/src/base/base.dart';
import 'package:hrd/src/common/common.dart';
import 'package:hrd/src/core/repository/timeoffPolicy/base_timeoff_policy_repository.dart';

class TimeOffPolicyRepository implements BaseTimeOffPolicyRepository {
  final BaseApiClient apiClient;

  TimeOffPolicyRepository({
    required this.apiClient,
  });

  @override
  Future<List<TimeOffPolicy>> getAll() async {
    Response response = await apiClient.get(Url.baseUrl + Url.timeOffPolicies);

    final listMap =
        BaseResponse<List>.fromJson(response.data, (json) => json as List).data;

    List<TimeOffPolicy> policies = [];

    for (Map data in listMap) {
      policies.add(
        TimeOffPolicy.fromJsonApi(
          Map<String, dynamic>.from(data),
        ),
      );
    }

    return policies;
  }
}
