import 'package:hrd/src/base/response/meta.dart';
import 'package:hrd/src/common/common.dart';
import 'package:hrd/src/core/bloc/bloc.dart';

abstract class BaseOvertimeRepository{

  Future<List<Overtime>> getAllOvertime();

  Future<Meta> submitOvertime(OvertimeFormData leave);
}