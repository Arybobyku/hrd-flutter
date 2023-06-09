import 'package:flutter/material.dart';
import 'package:hrd/src/app_router.dart';
import 'package:hrd/src/base/base.dart';
import 'package:hrd/src/common/common.dart';
import 'package:hrd/src/core/core.dart';
import 'package:hrd/src/ui/ui.dart';

part 'part/home_activity.dart';
part 'part/home_menu.dart';
part 'part/home_screen_header.dart';

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
        BlocProvider(
          create: (context) =>
              UserCubit(userRepository: context.read<BaseUserRepository>())
                ..initialize(),
        ),
      ],
      child: HomeView(),
    );
  }
}

class HomeView extends StatelessWidget with WidgetMixin, SnackBarMessageMixin {
  HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    User user = context.read<AuthenticationDataCubit>().state.data;
    return BlocListener<UserCubit, BaseState>(
      listener: (context, state) {
        if (state is LoadedState) {
          context.read<AuthenticationDataCubit>().initialize();
        }

        if (state is ErrorState) {
          showSnackBarMessage(context, "Gagal mengambil data user dari server");
        }
      },
      child: RefreshIndicator(
        onRefresh: () async {
          await context.read<UserCubit>().initialize();
        },
        child: ListView(
          children: [
            //Header
            HomeScreenHeader(user: user),
            HomeMenu(),
            HomeActivity(),
          ],
        ),
      ),
    );
  }
}
