import 'package:flutter/material.dart';
import 'package:hrd/src/app_router.dart';
import 'package:hrd/src/base/base.dart';
import 'package:hrd/src/common/common.dart';
import 'package:hrd/src/core/core.dart';
import 'package:hrd/src/ui/ui.dart';

class OvertimeScreen extends StatefulWidget {
  const OvertimeScreen({Key? key}) : super(key: key);

  @override
  State<OvertimeScreen> createState() => _OvertimeScreenState();
}

class _OvertimeScreenState extends State<OvertimeScreen> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => OvertimeDataCubit(
            overtimeRepository: context.read<BaseOvertimeRepository>(),
          )..initialize(),
        )
      ],
      child: OvertimeView(),
    );
  }
}

class OvertimeView extends StatelessWidget with WidgetMixin {
  OvertimeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lembur'),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () =>
            Navigator.pushNamed(context, RouteName.createOvertimeScreen),
      ),
      body: SafeArea(
        child: BlocBuilder<OvertimeDataCubit, BaseState>(
          builder: (BuildContext context, state) {
            if (state is LoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (state is EmptyState) {
              return EmptyRefreshWidget(
                onRefresh: () async {
                  context.read<OvertimeDataCubit>().initialize();
                },
              );
            }

            if (state is ErrorState) {
              return ErrorRefreshWidget(
                onRefresh: () async {
                  context.read<OvertimeDataCubit>().initialize();
                },
              );
            }

            if (state is LoadedState) {
              var listOvertime = (state.data as List<Overtime>);
              return RefreshIndicator(
                onRefresh: () async {
                  context.read<LeaveDataCubit>().initialize();
                },
                child: ListView.builder(
                  itemCount: listOvertime.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.pushNamed(
                            context,
                            RouteName.detailOvertimeScreen,
                            arguments: ScreenArgument(
                              data: listOvertime[index],
                            )
                        );
                      },
                      child: ReportCard(
                        title: listOvertime[index].startDate ?? "-",
                        value: "${listOvertime[index].totalHours ?? "-"} jam",
                        status: listOvertime[index].status ?? "-",
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
