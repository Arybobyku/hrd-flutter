import 'package:flutter/material.dart';
import 'package:hrd/src/base/base.dart';
import 'package:hrd/src/common/common.dart';
import 'package:hrd/src/common/mixin/status_mixin.dart';
import 'package:hrd/src/core/core.dart';
import 'package:hrd/src/ui/ui.dart';

class AttendanceScreen extends StatefulWidget {
  const AttendanceScreen({Key? key}) : super(key: key);

  @override
  State<AttendanceScreen> createState() => _AttendanceScreenState();
}

class _AttendanceScreenState extends State<AttendanceScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AttendanceHistoryCubit(
        attendanceRepository: context.read<BaseAttendanceRepository>(),
      )..initialize(),
      child: AttendanceView(),
    );
  }
}

class AttendanceView extends StatelessWidget with WidgetMixin, StatusMixin {
  AttendanceView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Absensi"),
      ),
      backgroundColor: DartdroidColor.white,
      body: SafeArea(
        child: BlocBuilder<AttendanceHistoryCubit, BaseState>(
          builder: (context, state) {
            if (state is LoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (state is EmptyState) {
              return EmptyRefreshWidget(
                onRefresh: () async {
                  context.read<AttendanceHistoryCubit>().initialize();
                },
              );
            }

            if (state is ErrorState) {
              return ErrorRefreshWidget(
                message: state.error,
                onRefresh: () async {
                  context.read<AttendanceHistoryCubit>().initialize();
                },
              );
            }

            if (state is LoadedState) {
              var attendances = (state.data as List<Attendance>);

              return RefreshIndicator(
                onRefresh: () async {
                  context.read<AttendanceHistoryCubit>().initialize();
                },
                child: ListView.builder(
                  itemCount: attendances.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding:
                          const EdgeInsets.only(left: 5, right: 5, top: 10),
                      child: Card(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 68,
                              width: 10,
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(5),
                                  bottomLeft: Radius.circular(5),
                                ),
                                color: statusBackgroundColor(
                                    attendances[index].status ?? "-"),
                              ),
                            ),
                            horizontalSpace10,
                            Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                verticalSpace10,
                                Text(
                                  "Absen Masuk",
                                  style: DartDroidFonts.normal(fontSize: 14),
                                ),
                                Text(
                                  "Absen Keluar",
                                  style: DartDroidFonts.normal(fontSize: 14),
                                ),
                                verticalSpace10,
                              ],
                            ),
                            horizontalSpace5,
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  verticalSpace10,
                                  Text(
                                    ": ${attendances[index].clockinTime ?? "-"}",
                                    style: DartDroidFonts.bold(
                                      fontSize: 14,
                                    ),
                                  ),
                                  Text(
                                    ": ${attendances[index].clockoutTime ?? "-"}",
                                    style: DartDroidFonts.bold(
                                      fontSize: 14,
                                    ),
                                  ),
                                  verticalSpace10,
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                children: [
                                  StatusCard(
                                    status: attendances[index].status ?? "-",
                                  ),
                                  verticalSpace5,
                                  Text(
                                    attendances[index].attendanceDate ?? "-",
                                    style: DartDroidFonts.normal(
                                      fontSize: 10,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
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
