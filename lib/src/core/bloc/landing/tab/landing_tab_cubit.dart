import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../common/common.dart';

class LandingTabCubit extends Cubit<String> {
  LandingTabCubit() : super(LandingTab.home);

  void changeTab(int index) {
    switch (index) {
      case 0:
        return emit(LandingTab.home);
      case 1:
        return emit(LandingTab.notification);
      case 2:
        return emit(LandingTab.profile);
      default:
        return emit(LandingTab.home);
    }
  }
}
