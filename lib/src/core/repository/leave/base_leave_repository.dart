import 'package:hrd/src/base/base.dart';
import 'package:hrd/src/common/common.dart';
import 'package:hrd/src/core/bloc/bloc.dart';

abstract class BaseLeaveRepository{
  Future<List<Leave>> getAllTimeOff();

  Future<Meta> submitLeave(LeaveFormData leave);
}