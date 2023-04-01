import 'package:flutter/material.dart';
import 'package:hrd/src/base/bloc/bloc.dart';
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
            name: RouteName.splashScreen,
            arguments: args?.data,
          ),
          builder: (_) => args?.bloc != null
              ? BlocProvider.value(
                  value: args!.bloc!,
                  child: const LandingScreen(),
                )
              : const LandingScreen(),
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
  static const String notFoundScreen = "notFoundScreen";
}
