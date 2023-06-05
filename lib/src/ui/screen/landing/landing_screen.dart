import 'package:flutter/material.dart';
import 'package:hrd/src/base/base.dart';
import 'package:hrd/src/common/common.dart';
import 'package:hrd/src/core/core.dart';
import 'package:hrd/src/ui/screen/home/home_screen.dart';
import 'package:hrd/src/ui/screen/notification/notification_screen.dart';

import '../../ui.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LandingTabCubit()..changeTab(0),
        ),
      ],
      child: const LandingView(),
    );
  }
}

class LandingView extends StatefulWidget {
  const LandingView({Key? key}) : super(key: key);

  @override
  State<LandingView> createState() => _LandingViewState();
}

class _LandingViewState extends State<LandingView>
    with LandingTabBarMixin, SnackBarMessageMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: MultiBlocListener(
          listeners: [
            BlocListener<AuthenticationActionCubit, BaseState<AuthMeta>>(
              listener: (context, state) {
                if (state is SuccessState &&
                    state.data?.type == AuthMetaType.signOut) {
                  context.read<AuthenticationDataCubit>().initialize();
                }

                if (state is ErrorState &&
                    state.data?.type == AuthMetaType.signOut) {
                  showSnackBarMessage(context, (state as ErrorState).error);
                }
              },
            ),
          ],
          child: BlocBuilder<AuthenticationActionCubit, BaseState<AuthMeta>>(
            builder: (context, state) {
              var isLoading = (state is LoadingState &&
                  state.data!.type == AuthMetaType.signOut);
              return FullLoading(
                isLoading: isLoading,
                child: BlocBuilder<LandingTabCubit, String>(
                  builder: (context, state) {
                    if (state == LandingTab.home) {
                      return const HomeScreen();
                    }

                    if (state == LandingTab.notification) {
                      return const NotificationScreen();
                    }

                    if (state == LandingTab.profile) {
                      return const ProfileScreen();
                    }

                    return const HomeScreen();
                  },
                ),
              );
            },
          ),
        ),
      ),
      bottomNavigationBar: BlocBuilder<LandingTabCubit, String>(
        builder: (context, state) {
          return BottomNavigationBar(
            currentIndex: currentIndexFromString(state),
            onTap: (value) {
              context.read<LandingTabCubit>().changeTab(value);
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: "Homes",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.notifications),
                label: "Notification",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: "Profile",
              ),
            ],
          );
        },
      ),
    );
  }
}
