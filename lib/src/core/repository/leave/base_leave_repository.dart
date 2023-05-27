import 'package:hrd/src/common/common.dart';

abstract class BaseLeaveRepository{
  Future<List<Leave>> getAllTimeOff();

  Future<void> submitLeave(Leave leave);
}