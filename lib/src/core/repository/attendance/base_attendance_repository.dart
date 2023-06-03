import 'package:hrd/src/base/base.dart';
import 'package:hrd/src/common/common.dart';

abstract class BaseAttendanceRepository {
  Future<Meta> clockIn(Attendance attendance);

  Future<Meta> clockOut(Attendance attendance);

  Future<Attendance?> getCurrentDateAttendance();

  Future<List<Attendance>> getAll();
}
