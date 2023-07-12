import 'package:flutter/material.dart';
import 'package:hrd/src/base/base.dart';
import 'package:hrd/src/common/common.dart';
import 'package:hrd/src/core/core.dart';
import 'package:hrd/src/core/repository/timeoffPolicy/base_timeoff_policy_repository.dart';
import 'package:hrd/src/ui/ui.dart';

class CreateLeaveScreen extends StatefulWidget {
  const CreateLeaveScreen({Key? key}) : super(key: key);

  @override
  State<CreateLeaveScreen> createState() => _CreateLeaveScreenState();
}

class _CreateLeaveScreenState extends State<CreateLeaveScreen> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocProvider(
          create: (
            context,
          ) =>
              CreateLeaveFormCubit(
            leaveRepository: context.read<BaseLeaveRepository>(),
          ),
        ),
        BlocProvider(
          create: (
            context,
          ) =>
              CreateLeaveActionCubit(
            timeOffPolicyRepository:
                context.read<BaseTimeOffPolicyRepository>(),
          )..initialize(),
        )
      ],
      child: CreateLeaveView(),
    );
  }
}

class CreateLeaveView extends StatelessWidget
    with WidgetMixin, BottomSheetMixin, CalendarMixin, SnackBarMessageMixin {
  CreateLeaveView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ajukan Cuti"),
      ),
      body: SafeArea(
        child: BlocListener<CreateLeaveFormCubit, BaseState>(
          listener: (context, listenerState) {
            if (listenerState is ErrorState) {
              showSnackBarMessage(context, listenerState.error);
            }

            if (listenerState is SuccessState) {
              showSuccessDialog(
                context,
                description: "Berhasil mengajukan cuti",
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pop(context, true);
                },
              );
            }
          },
          child: BlocBuilder<CreateLeaveFormCubit, BaseState<LeaveFormData>>(
            builder: (context, state) {
              return FullLoading(
                isLoading: state is LoadingState,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        verticalSpace20,
                        BlocBuilder<CreateLeaveActionCubit, BaseState>(
                          builder: (context, actionState) {
                            if (actionState is LoadingState) {
                              return const DisablerWidget(
                                disable: true,
                                child: DropDownWidget(
                                  title: "Jenis Cuti",
                                  isRequired: true,
                                  hint: "Loading ...",
                                ),
                              );
                            }

                            return DropDownWidget(
                              title: "Jenis Cuti",
                              isRequired: true,
                              hint: "Jenis Cuti",
                              items: (actionState.data as List<TimeOffPolicy>)
                                  .map((e) => {"key": e.id, "value": e.name})
                                  .toList(),
                              callbackWithoutValidator: (val) {
                                context
                                    .read<CreateLeaveFormCubit>()
                                    .updateFormLeaveType(
                                        state.data!, val!.values.first);
                              },
                            );
                          },
                        ),
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
                                        .read<CreateLeaveFormCubit>()
                                        .updateFormStartDate(
                                          state.data!,
                                          date,
                                        );
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
                                        .read<CreateLeaveFormCubit>()
                                        .updateFormEndData(state.data!, date);
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                        verticalSpace20,
                        TextFormFieldRounded(
                          title: 'Total Hari',
                          isRequired: true,
                          keyboardType: TextInputType.number,
                          onChange: (val) => context
                              .read<CreateLeaveFormCubit>()
                              .updateFormTotalDays(state.data!, val),
                        ),
                        verticalSpace20,
                        TextFormFieldRounded(
                          title: 'Alasan',
                          isRequired: true,
                          minLines: 5,
                          onChange: (val) => context
                              .read<CreateLeaveFormCubit>()
                              .updateFormReason(state.data!, val),
                        ),
                        verticalSpace(30),
                        BlocSelector<CreateLeaveFormCubit,
                            BaseState<LeaveFormData>, FormFieldData>(
                          selector: (state) => FormFieldData(
                            validate: [
                              state.data!.leaveTypes,
                              state.data!.reasons,
                              state.data!.startDate,
                              state.data!.endDate,
                              state.data!.totalDays,
                            ],
                          ),
                          builder: (context, validateState) {
                            return DisablerWidget(
                              disable: validateState.hasEmptyField,
                              child: ButtonRounded(
                                text: "Kirim",
                                onPressed: () => context
                                    .read<CreateLeaveFormCubit>()
                                    .submitFormLeave(state.data!),
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
      ),
    );
  }
}
