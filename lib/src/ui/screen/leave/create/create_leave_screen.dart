import 'package:flutter/material.dart';
import 'package:hrd/src/base/base.dart';
import 'package:hrd/src/common/common.dart';
import 'package:hrd/src/common/model/form_field_data/form_field_data.dart';
import 'package:hrd/src/core/bloc/bloc.dart';
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
                CreateLeaveFormCubit())
      ],
      child: CreateLeaveView(),
    );
  }
}

class CreateLeaveView extends StatelessWidget
    with WidgetMixin, BottomSheetMixin, CalendarMixin {
  CreateLeaveView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ajukan Cuti"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: BlocBuilder<CreateLeaveFormCubit, BaseState<LeaveFormData>>(
              builder: (context, state) {
                return Column(
                  children: [
                    verticalSpace20,
                    DropDownWidget(
                      title: "Jenis Cuti",
                      isRequired: true,
                      items: const [
                        {'key': 1, 'value': "BARU"},
                        {'key': 2, 'value': "PENGGANTIAN"},
                        {'key': 3, 'value': "PERPANJANGAN"},
                      ],
                      callbackWithoutValidator: (val) {
                        context
                            .read<CreateLeaveFormCubit>()
                            .updateFormLeaveTypes(
                                state.data!, val!.values.toString());
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
                            value: state.data!.startDate,
                            onTap: () async {
                              final DateTime? date = await showDatePickerDialog(
                                context,
                                firstData: DateTime.now(),
                              );

                              context
                                  .read<CreateLeaveFormCubit>()
                                  .updateFormStartDate(state.data!, date!);
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
                            value: state.data!.endDate,
                            onTap: () async {
                              final DateTime? date = await showDatePickerDialog(
                                  context,
                                  firstData: state.data!.startDate);

                              context
                                  .read<CreateLeaveFormCubit>()
                                  .updateFormEndData(state.data!, date!);
                            },
                          ),
                        ),
                      ],
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
                    BlocSelector<CreateLeaveFormCubit, BaseState<LeaveFormData>,
                        FormFieldData>(
                      selector: (state) => FormFieldData(
                        validate: [
                          state.data!.reasons,
                          state.data!.leaveTypes,
                          state.data!.startDate,
                          state.data!.endDate,
                        ],
                      ),
                      builder: (context, state) {
                        return DisablerWidget(
                          disable: state.hasEmptyField,
                          child: ButtonRounded(
                            text: "Kirim",
                            onPressed: () {},
                          ),
                        );
                      },
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
