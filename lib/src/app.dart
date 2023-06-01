import 'package:clock/clock.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:hrd/src/app_router.dart';
import 'package:hrd/src/base/base.dart';
import 'package:hrd/src/common/common.dart';

import 'core/core.dart';

class App extends StatelessWidget {
  final Connectivity connectivity;

  /// SERVICE
  final BaseConnectionService connectionService;

  /// REPOSITORY
  final BaseAuthenticationRepository authenticationRepository;
  final BaseLeaveRepository leaveRepository;
  final BaseOvertimeRepository overtimeRepository;

  const App({
    Key? key,
    required this.connectivity,
    required this.connectionService,
    required this.authenticationRepository,
    required this.leaveRepository,
    required this.overtimeRepository,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (context) => connectionService),
        RepositoryProvider(create: (context) => leaveRepository),
        RepositoryProvider(create: (context) => overtimeRepository),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AuthenticationDataCubit(
              authenticationRepository: authenticationRepository,
              clock: clock,
            )..initialize(),
          ),
          BlocProvider(
            create: (context) => AuthenticationActionCubit(
              authenticationRepository: authenticationRepository,
            ),
          ),
          BlocProvider(
            create: (context) => ConnectionCubit(
              connectionService: connectionService,
            )..initialize(),
          ),
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

class _DartdroidAppState extends State<DartdroidApp>
    with WidgetsBindingObserver {
  final AppRouter _appRouter = AppRouter();
  final _navKey = GlobalKey<NavigatorState>();

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    // Initialize connection listener

    context.read<ConnectionCubit>()
      ..initialize()
      ..periodicCheck();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: _navKey,
      initialRoute: RouteName.splashScreen,
      theme: ThemeData(
        scaffoldBackgroundColor: DartdroidColor.background,
        appBarTheme: AppBarTheme(
          titleTextStyle:
              DartDroidFonts.bold(fontSize: 22, color: DartdroidColor.white),
          backgroundColor: DartdroidColor.primary,
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: DartdroidColor.primary,
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: DartdroidColor.background,
          selectedItemColor: DartdroidColor.primary,
          unselectedItemColor: DartdroidColor.greyLighten30,
          selectedLabelStyle: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
          unselectedLabelStyle: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
          enableFeedback: false,
        ),
      ),
      onGenerateRoute: _appRouter.onGenerateRoute,
      builder: (BuildContext materialContext, Widget? child) {
        return Scaffold(
          bottomNavigationBar: BlocBuilder<ConnectionCubit, ConnectionStatus>(
            builder: (context, state) {
              if (state == ConnectionStatus.offline) {
                return Container(
                  height: 40,
                  color: DartdroidColor.blue,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Center(
                    child: Text(
                      'Tidak Ada Koneksi Internet',
                      style: DartDroidFonts.normal(color: Colors.white),
                    ),
                  ),
                );
              }

              return const SizedBox();
            },
          ),
          body: MultiBlocListener(
            listeners: [
              BlocListener<AuthenticationDataCubit, BaseState>(
                listener: (context, state) {
                  if (state is UnauthenticatedState) {
                    _navKey.currentState!.pushNamedAndRemoveUntil(
                      RouteName.loginScreen,
                      (route) => false,
                    );
                  }

                  if (state is AuthenticatedState) {
                    _navKey.currentState!.pushNamedAndRemoveUntil(
                      RouteName.landingScreen,
                      (route) => false,
                    );
                  }
                },
              ),
            ],
            child: child!,
          ),
        );
      },
    );
  }
}
