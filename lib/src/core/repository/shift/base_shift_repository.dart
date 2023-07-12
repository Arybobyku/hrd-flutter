import 'package:hrd/src/common/model/model.dart';

abstract class BaseShiftRepository{
  Future<List<Shift>> getAll();
}