part of '../home_screen.dart';

class HomeActivity extends StatelessWidget
    with WidgetMixin, SnackBarMessageMixin {
  HomeActivity({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: BlocListener<AttendanceActionCubit, BaseState>(
        listener: (context, listenerState) {
          if (listenerState is SuccessState) {
            context.read<AttendanceDataCubit>().initialize();
          }

          if (listenerState is ErrorState) {
            showSnackBarMessage(context, listenerState.error);
          }
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Aktifitas Hari ini",
              style: DartDroidFonts.bold(fontSize: 18),
            ),
            verticalSpace20,
            BlocBuilder<AttendanceDataCubit, BaseState<Attendance?>>(
              builder: (context, state) {
                User user = context.read<AuthenticationDataCubit>().state.data;

                if (state is ErrorState) {
                  return ErrorButtonWidget(
                    message: (state as ErrorState).error,
                    onTap: () {
                      context.read<AttendanceDataCubit>().initialize();
                    },
                  );
                }

                if (state is LoadingState) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                if (state is LoadedState) {
                  return BlocBuilder<AttendanceActionCubit, BaseState>(
                    builder: (context, attendanceActionState) {
                      if (attendanceActionState is LoadingState) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }

                      if (user.userShift?.shift == null) {
                        return Text(
                          "Anda belum memiliki shift kerja. Harap menghubungi admin terkait.",
                          style: DartDroidFonts.normal(
                            fontSize: 14,
                          ),
                          textAlign: TextAlign.center,
                        );
                      }

                      return AttendanceCard(
                        shift: user.userShift?.shift,
                        organizationHierarchy: user.employee?.branch,
                        onTapClockIn: () =>
                            context.read<AttendanceActionCubit>().clockIn(
                                  shiftId: user.userShift?.shift?.id,
                                ),
                        onTapClockOut: () =>
                            context.read<AttendanceActionCubit>().clockOut(
                                  id: state.data?.id,
                                ),
                        attendance: state.data,
                      );
                    },
                  );
                }

                return const SizedBox();
              },
            ),
          ],
        ),
      ),
    );
  }
}
