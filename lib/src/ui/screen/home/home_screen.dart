import 'package:flutter/material.dart';
import 'package:hrd/src/base/base.dart';
import 'package:hrd/src/common/common.dart';
import 'package:hrd/src/core/bloc/authentication/authentication.dart';
import 'package:hrd/src/ui/ui.dart';

part 'part/home_screen_header.dart';
part 'part/home_activity.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return HomeView();
  }
}

class HomeView extends StatelessWidget with WidgetMixin{
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
          HomeActivity(),
        ],
      ),
    );
  }
}
