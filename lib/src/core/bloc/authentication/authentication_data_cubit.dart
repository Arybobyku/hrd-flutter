import 'package:clock/clock.dart';
import 'package:hrd/src/base/base.dart';

import '../../core.dart';

class AuthenticationDataCubit extends Cubit<BaseState> {
  final Clock clock;
  final BaseAuthenticationRepository authenticationRepository;

  AuthenticationDataCubit({
    required this.clock,
    required this.authenticationRepository,
}) : super(InitializedState());
  //TODO: INITIALIZE
  void initialize(){

  }
}
