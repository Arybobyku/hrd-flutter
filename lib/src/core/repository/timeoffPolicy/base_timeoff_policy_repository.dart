import 'package:hrd/src/common/common.dart';

abstract class BaseTimeOffPolicyRepository{
  Future<List<TimeOffPolicy>> getAll();
}