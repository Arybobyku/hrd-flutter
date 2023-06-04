import 'package:flutter/material.dart';
import 'package:hrd/src/common/common.dart';
import 'package:hrd/src/ui/ui.dart';

class DetailOvertimeScreen extends StatefulWidget {
  const DetailOvertimeScreen({Key? key}) : super(key: key);

  @override
  State<DetailOvertimeScreen> createState() => _DetailOvertimeScreenState();
}

class _DetailOvertimeScreenState extends State<DetailOvertimeScreen> {
  @override
  Widget build(BuildContext context) {
    Overtime? args;
    if (ModalRoute.of(context)!.settings.arguments != null) {
      args = ModalRoute.of(context)!.settings.arguments as Overtime;
    }
    return DetailOvertimeView(
      overtime: args!,
    );
  }
}

class DetailOvertimeView extends StatelessWidget with WidgetMixin {
  final Overtime overtime;

  DetailOvertimeView({Key? key, required this.overtime}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Lembur"),
      ),
      backgroundColor: DartdroidColor.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                verticalSpace10,
                Row(
                  children: [
                    Expanded(
                      child: TitleValueWidget(
                        title: "Jam Mulai",
                        value: overtime.startTime ?? "-",
                      ),
                    ),
                    StatusCard(status: overtime.status ?? "-")
                  ],
                ),
                TitleValueWidget(
                  title: "Total Jam",
                  value:  "${overtime.totalHours ?? "-"} jam",
                ),
                TitleValueWidget(
                  title: "Tgl Selesai",
                  value: overtime.endDate ?? "-",
                ),
                TitleValueWidget(
                  title: "Tgl Selesai",
                  value: overtime.endDate ?? "-",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
