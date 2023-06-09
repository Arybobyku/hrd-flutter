import 'package:flutter/material.dart';
import 'package:hrd/src/base/bloc/bloc.dart';
import 'package:hrd/src/ui/screen/leave/detail/detail_leave_screen.dart';
import 'package:hrd/src/ui/screen/screen.dart';

import 'common/common.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings routeSettings) {
    final ScreenArgument? args = routeSettings.arguments != null
        ? routeSettings.arguments as ScreenArgument
        : null;

    switch (routeSettings.name) {
      case RouteName.loginScreen:
        return MaterialPageRoute(
          settings: RouteSettings(
            name: RouteName.loginScreen,
            arguments: args?.data,
          ),
          builder: (_) => args?.bloc != null
              ? BlocProvider.value(
                  value: args!.bloc!,
                  child: const LoginScreen(),
                )
              : const LoginScreen(),
        );

      case RouteName.registerScreen:
        return MaterialPageRoute(
          settings: RouteSettings(
            name: RouteName.registerScreen,
            arguments: args?.data,
          ),
          builder: (_) => args?.bloc != null
              ? BlocProvider.value(
                  value: args!.bloc!,
                  child: const RegisterScreen(),
                )
              : const RegisterScreen(),
        );

      case RouteName.splashScreen:
        return MaterialPageRoute(
          settings: RouteSettings(
            name: RouteName.splashScreen,
            arguments: args?.data,
          ),
          builder: (_) => args?.bloc != null
              ? BlocProvider.value(
                  value: args!.bloc!,
                  child: const SplashScreen(),
                )
              : const SplashScreen(),
        );
      case RouteName.landingScreen:
        return MaterialPageRoute(
          settings: RouteSettings(
            name: RouteName.landingScreen,
            arguments: args?.data,
          ),
          builder: (_) => args?.bloc != null
              ? BlocProvider.value(
                  value: args!.bloc!,
                  child: const LandingScreen(),
                )
              : const LandingScreen(),
        );
      case RouteName.leaveScreen:
        return MaterialPageRoute(
          settings: RouteSettings(
            name: RouteName.leaveScreen,
            arguments: args?.data,
          ),
          builder: (_) => args?.bloc != null
              ? BlocProvider.value(
                  value: args!.bloc!,
                  child: const LeaveScreen(),
                )
              : const LeaveScreen(),
        );
      case RouteName.createLeaveScreen:
        return MaterialPageRoute(
          settings: RouteSettings(
            name: RouteName.createLeaveScreen,
            arguments: args?.data,
          ),
          builder: (_) => args?.bloc != null
              ? BlocProvider.value(
                  value: args!.bloc!,
                  child: const CreateLeaveScreen(),
                )
              : const CreateLeaveScreen(),
        );

      case RouteName.detailLeaveScreen:
        return MaterialPageRoute(
          settings: RouteSettings(
            name: RouteName.detailLeaveScreen,
            arguments: args?.data,
          ),
          builder: (_) => args?.bloc != null
              ? BlocProvider.value(
                  value: args!.bloc!,
                  child: const DetailLeaveScreen(),
                )
              : const DetailLeaveScreen(),
        );
      case RouteName.overtimeScreen:
        return MaterialPageRoute(
          settings: RouteSettings(
            name: RouteName.overtimeScreen,
            arguments: args?.data,
          ),
          builder: (_) => args?.bloc != null
              ? BlocProvider.value(
                  value: args!.bloc!,
                  child: const OvertimeScreen(),
                )
              : const OvertimeScreen(),
        );
      case RouteName.createOvertimeScreen:
        return MaterialPageRoute(
          settings: RouteSettings(
            name: RouteName.createOvertimeScreen,
            arguments: args?.data,
          ),
          builder: (_) => args?.bloc != null
              ? BlocProvider.value(
                  value: args!.bloc!,
                  child: const CreateOvertimeScreen(),
                )
              : const CreateOvertimeScreen(),
        );
      case RouteName.detailOvertimeScreen:
        return MaterialPageRoute(
          settings: RouteSettings(
            name: RouteName.detailOvertimeScreen,
            arguments: args?.data,
          ),
          builder: (_) => args?.bloc != null
              ? BlocProvider.value(
                  value: args!.bloc!,
                  child: const DetailOvertimeScreen(),
                )
              : const DetailOvertimeScreen(),
        );
      case RouteName.attendanceScreen:
        return MaterialPageRoute(
          settings: RouteSettings(
            name: RouteName.attendanceScreen,
            arguments: args?.data,
          ),
          builder: (_) => args?.bloc != null
              ? BlocProvider.value(
                  value: args!.bloc!,
                  child: const AttendanceScreen(),
                )
              : const AttendanceScreen(),
        );
      case RouteName.profileDetailScreen:
        return MaterialPageRoute(
          settings: RouteSettings(
            name: RouteName.profileDetailScreen,
            arguments: args?.data,
          ),
          builder: (_) => args?.bloc != null
              ? BlocProvider.value(
                  value: args!.bloc!,
                  child: const ProfileDetailScreen(),
                )
              : const ProfileDetailScreen(),
        );
      case RouteName.announcementScreen:
        return MaterialPageRoute(
          settings: RouteSettings(
            name: RouteName.announcementScreen,
            arguments: args?.data,
          ),
          builder: (_) => args?.bloc != null
              ? BlocProvider.value(
                  value: args!.bloc!,
                  child: const AnnouncementScreen(),
                )
              : const AnnouncementScreen(),
        );
      default:
        return MaterialPageRoute(
          settings: const RouteSettings(
            name: RouteName.notFoundScreen,
          ),
          builder: (context) => const Center(
            child: Text("Not Found Routes"),
          ),
        );
    }
  }
}

class RouteName {
  static const String splashScreen = "splashScreen";
  static const String loginScreen = "loginScreen";
  static const String registerScreen = "registerScreen";
  static const String landingScreen = "landingScreen";

  static const String leaveScreen = "leaveScreen";
  static const String createLeaveScreen = "createLeaveScreen";
  static const String detailLeaveScreen = "detailLeaveScreen";

  static const String attendanceScreen = "attendanceScreen";

  static const String profileDetailScreen = "profileDetailScreen";

  static const String announcementScreen = "announcementScreen";

  static const String overtimeScreen = "overtimeScreen";
  static const String createOvertimeScreen = "createOvertimeScreen";
  static const String detailOvertimeScreen = "detailOvertimeScreen";
  static const String notFoundScreen = "notFoundScreen";
}
