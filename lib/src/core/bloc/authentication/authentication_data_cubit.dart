import 'package:clock/clock.dart';
import 'package:hrd/src/base/base.dart';

class AuthenticationDataCubit extends Cubit<BaseState> {
  final Clock clock;

  AuthenticationDataCubit({
    required this.clock,
}) : super(InitializedState());
  //TODO: INITIALIZE
  void initialize(){

  }
}
