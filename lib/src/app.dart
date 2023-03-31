import 'package:clock/clock.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hrd/src/app_router.dart';
import 'package:hrd/src/base/base.dart';
import 'package:hrd/src/core/bloc/authentication/authentication.dart';

class App extends StatelessWidget {
  final Connectivity connectivity;

  const App({
    Key? key,
    required this.connectivity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AuthenticationDataCubit(
              clock: clock,
            ),
          ),
          BlocProvider(
            create: (context) => AuthenticationActionCubit(),
          )
        ],
        child: const DartdroidApp(),
      ),
    );
  }
}

class DartdroidApp extends StatefulWidget {
  const DartdroidApp({Key? key}) : super(key: key);

  @override
  State<DartdroidApp> createState() => _DartdroidAppState();
}

class _DartdroidAppState extends State<DartdroidApp> {
  final AppRouter _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: RouteName.splashScreen,
      onGenerateRoute: _appRouter.onGenerateRoute,
      builder: (BuildContext context, Widget? child) {
        return Scaffold(
          body: MultiBlocProvider(
            providers: [],
            child: BlocBuilder<AuthenticationDataCubit, BaseState>(
              builder: (context, state){
                return Container();
              },
            ),
          ),
        );
      },
    );
  }
}
