import 'package:flutter/material.dart';
import 'package:hrd/src/base/base.dart';
import 'package:hrd/src/common/common.dart';
import 'package:hrd/src/core/core.dart';
import 'package:hrd/src/ui/ui.dart';

class CreateOvertimeScreen extends StatefulWidget {
  const CreateOvertimeScreen({Key? key}) : super(key: key);

  @override
  State<CreateOvertimeScreen> createState() => _CreateOvertimeScreenState();
}

class _CreateOvertimeScreenState extends State<CreateOvertimeScreen> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (
            context,
          ) =>
              CreateOvertimeFormCubit(
            overtimeRepository: context.read<BaseOvertimeRepository>(),
          ),
        )
      ],
      child: CreateOvertimeView(),
    );
  }
}

class CreateOvertimeView extends StatelessWidget
    with WidgetMixin, BottomSheetMixin, CalendarMixin, SnackBarMessageMixin {
  CreateOvertimeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pengajuan Lembur"),
      ),
      body: SafeArea(
        child:
            BlocConsumer<CreateOvertimeFormCubit, BaseState>(
          listener: (context, listenerState) {
            if (listenerState is ErrorState) {
              showSnackBarMessage(context, listenerState.error);
            }

            if (listenerState is SuccessState) {
              showSuccessDialog(
                context,
                description: "Berhasil mengajukan lembur",
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pop(context, true);
                },
              );
            }
          },
          builder: (context, state) {
            return FullLoading(
              isLoading: state is LoadingState,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      verticalSpace20,
                      Row(
                        children: [
                          Expanded(
                            child: FormDateTimeWidget(
                              title: "Tgl Mulai",
                              hintText: 'Tgl Mulai',
                              isOnlyDate: true,
                              isRequired: true,
                              icon: Icons.date_range,
                              value: state.data?.startDate,
                              onTap: () async {
                                final DateTime? date =
                                    await showDatePickerDialog(
                                  context,
                                  firstData: DateTime.now(),
                                );

                                if (context.mounted && date != null) {
                                  context
                                      .read<CreateOvertimeFormCubit>()
                                      .updateFormStartDate(state.data!, date);
                                }
                              },
                            ),
                          ),
                          horizontalSpace20,
                          Expanded(
                            child: FormDateTimeWidget(
                              title: "Tgl Selesai",
                              isRequired: true,
                              isOnlyDate: true,
                              hintText: 'Tgl Selesai',
                              icon: Icons.date_range,
                              value: state.data?.endDate,
                              onTap: () async {
                                final DateTime? date =
                                    await showDatePickerDialog(context,
                                        firstData: DateTime.now());
                                if (context.mounted && date != null) {
                                  context
                                      .read<CreateOvertimeFormCubit>()
                                      .updateFormEndDate(state.data!, date);
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                      verticalSpace20,
                      FormTimeDayWidget(
                        title: "Jam Mulai",
                        isRequired: true,
                        hintText: "Jam Mulai",
                        icon: Icons.access_time,
                        value: state.data?.startTime,
                        onTap: () async {
                          final TimeOfDay? time = await showTimePickerDialog(
                            context,
                          );

                          if (context.mounted && time != null) {
                            context
                                .read<CreateOvertimeFormCubit>()
                                .updateFormStartTime(
                                    state.data!, time.to24hours);
                          }
                        },
                      ),
                      verticalSpace20,
                      TextFormFieldRounded(
                        title: 'Total Jam',
                        isRequired: true,
                        minLines: 1,
                        keyboardType: TextInputType.number,
                        onChange: (val) => context
                            .read<CreateOvertimeFormCubit>()
                            .updateFormTotalHours(state.data!, int.parse(val)),
                      ),
                      verticalSpace(30),
                      BlocSelector<CreateOvertimeFormCubit,
                          BaseState<OvertimeFormData>, FormFieldData>(
                        selector: (state) => FormFieldData(
                          validate: [
                            state.data!.startTime,
                            state.data!.startDate,
                            state.data!.endDate,
                            state.data!.totalHours,
                          ],
                        ),
                        builder: (context, validateState) {
                          return DisablerWidget(
                            disable: validateState.hasEmptyField,
                            child: ButtonRounded(
                              text: "Kirim",
                              onPressed: () => context
                                  .read<CreateOvertimeFormCubit>()
                                  .submitFormOvertime(state.data!),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
