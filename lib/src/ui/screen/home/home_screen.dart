import 'package:flutter/material.dart';
import 'package:hrd/src/app_router.dart';
import 'package:hrd/src/base/base.dart';
import 'package:hrd/src/common/common.dart';
import 'package:hrd/src/core/bloc/attendance/attendance.dart';
import 'package:hrd/src/core/bloc/authentication/authentication.dart';
import 'package:hrd/src/core/core.dart';
import 'package:hrd/src/ui/ui.dart';

part 'part/home_screen_header.dart';

part 'part/home_activity.dart';

part 'part/home_menu.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AttendanceDataCubit(
            attendanceRepository: context.read<BaseAttendanceRepository>(),
          )..initialize(),
        ),
        BlocProvider(
          create: (context) => AttendanceActionCubit(
            attendanceRepository: context.read<BaseAttendanceRepository>(),
          ),
        ),
      ],
      child: HomeView(),
    );
  }
}

class HomeView extends StatelessWidget with WidgetMixin {
  HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    User user = context.read<AuthenticationDataCubit>().state.data;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //Header
          HomeScreenHeader(user: user),
          HomeMenu(),
          HomeActivity(),
        ],
      ),
    );
  }
}
