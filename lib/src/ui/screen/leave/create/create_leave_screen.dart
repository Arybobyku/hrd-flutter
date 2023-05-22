import 'package:flutter/material.dart';
import 'package:hrd/src/common/common.dart';
import 'package:hrd/src/common/mixin/bottom_sheet_mixin.dart';
import 'package:hrd/src/ui/ui.dart';

class CreateLeaveScreen extends StatefulWidget {
  const CreateLeaveScreen({Key? key}) : super(key: key);

  @override
  State<CreateLeaveScreen> createState() => _CreateLeaveScreenState();
}

class _CreateLeaveScreenState extends State<CreateLeaveScreen> {
  @override
  Widget build(BuildContext context) {
    return CreateLeaveView();
  }
}

class CreateLeaveView extends StatelessWidget with WidgetMixin, BottomSheetMixin {
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
            child: Column(
              children: [
                verticalSpace20,
                FormDateTimeWidget(
                  title: 'Tanggal & Waktu',
                  hintText: 'DD-MM-YYYY 00:00',
                  onTap: () async{
                    final DateTime? birthDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1800),
                      lastDate: DateTime(2500),
                      builder: (context, child) {
                        return Theme(
                          data: Theme.of(context).copyWith(
                            colorScheme:  const ColorScheme.light(
                              primary: DartdroidColor.primary,
                              onPrimary: DartdroidColor.white,
                            ),
                            textButtonTheme: TextButtonThemeData(
                              style: TextButton.styleFrom(
                                primary: DartdroidColor.primary,
                              ),
                            ),
                          ),
                          child: child!,
                        );
                      },
                    );
                  },
                ),
                verticalSpace20,
                DropDownWidget(
                  title: "Jenis Cuti",
                  items: const [
                    {'key': 1, 'value': "BARU"},
                    {'key': 2, 'value': "PENGGANTIAN"},
                    {'key': 3, 'value': "PERPANJANGAN"},
                  ],
                  callbackWithoutValidator: (val) {},
                ),
                verticalSpace20,
                TextFormFieldRounded(
                  label: "Alasan",
                  onChange: (val) {},
                ),
                verticalSpace20,
                ButtonRounded(
                  text: "Kirim",
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
