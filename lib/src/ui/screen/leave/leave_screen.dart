import 'package:flutter/material.dart';
import 'package:hrd/src/app_router.dart';
import 'package:hrd/src/base/base.dart';
import 'package:hrd/src/common/common.dart';
import 'package:hrd/src/core/core.dart';
import 'package:hrd/src/ui/ui.dart';

class LeaveScreen extends StatefulWidget {
  const LeaveScreen({Key? key}) : super(key: key);

  @override
  State<LeaveScreen> createState() => _LeaveScreenState();
}

class _LeaveScreenState extends State<LeaveScreen> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LeaveDataCubit(
            leaveRepository: context.read<BaseLeaveRepository>(),
          )..initialize(),
        )
      ],
      child: LeaveView(),
    );
  }
}

class LeaveView extends StatelessWidget with WidgetMixin {
  LeaveView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cuti"),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () =>
            Navigator.pushNamed(context, RouteName.createLeaveScreen),
      ),
      body: SafeArea(
        child: BlocBuilder<LeaveDataCubit, BaseState>(
          builder: (context, state) {
            if (state is LoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (state is EmptyState) {
              return EmptyRefreshWidget(
                onRefresh: () async {
                  context.read<LeaveDataCubit>().initialize();
                },
              );
            }

            if (state is ErrorState) {
              return ErrorRefreshWidget(
                onRefresh: () async {
                  context.read<LeaveDataCubit>().initialize();
                },
              );
            }

            if (state is LoadedState) {
              var listLeave = (state.data as List<Leave>);
              return RefreshIndicator(
                onRefresh: () async {
                  context.read<LeaveDataCubit>().initialize();
                },
                child: ListView.builder(
                  itemCount: listLeave.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          RouteName.detailLeaveScreen,
                          arguments: ScreenArgument(
                            data: listLeave[index],
                          )
                        );
                      },
                      child: ReportCard(
                        title: listLeave[index].reasons ?? "-",
                        value: "${listLeave[index].startDate}",
                        status: listLeave[index].status ?? "-",
                      ),
                    );
                  },
                ),
              );
            }

            return const SizedBox();
          },
        ),
      ),
    );
  }
}
