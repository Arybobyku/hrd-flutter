import 'package:clock/clock.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:hrd/src/app_router.dart';
import 'package:hrd/src/base/base.dart';
import 'package:hrd/src/common/common.dart';
import 'package:hrd/src/common/utility/dartdroid_font.dart';
import 'package:hrd/src/core/bloc/authentication/authentication.dart';
import 'package:hrd/src/core/bloc/connection/connection.dart';
import 'package:hrd/src/core/service/connection/base_connection_service.dart';

class App extends StatelessWidget {
  final Connectivity connectivity;

  final BaseConnectionService connectionService;

  const App({
    Key? key,
    required this.connectivity,
    required this.connectionService,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (context) => connectionService),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AuthenticationDataCubit(
              clock: clock,
            ),
          ),
          BlocProvider(
            create: (context) => AuthenticationActionCubit(),
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
          bottomNavigationBar: BlocBuilder<ConnectionCubit, ConnectionStatus>(
            builder: (context, state) {
              if (state == ConnectionStatus.offline) {
                return Container(
                  height: 40,
                  color: DartdroidColor.red,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Center(
                    child: Text(
                      'Tidak Ada Koneksi Internet',
                      style: DartdroidFont.regular14(color: Colors.white),
                    ),
                  ),
                );
              }

              return const SizedBox();
            },
          ),
          body: MultiBlocListener(
            listeners: [
              BlocListener(
                listener: (context, state) {},
              ),
            ],
            child: BlocBuilder<AuthenticationDataCubit, BaseState>(
              builder: (context, state) {
                return Container();
              },
            ),
          ),
        );
      },
    );
  }
}
