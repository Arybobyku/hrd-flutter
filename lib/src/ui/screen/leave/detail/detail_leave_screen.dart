import 'package:flutter/material.dart';
import 'package:hrd/src/common/common.dart';
import 'package:hrd/src/ui/ui.dart';

class DetailLeaveScreen extends StatefulWidget {
  const DetailLeaveScreen({Key? key}) : super(key: key);

  @override
  State<DetailLeaveScreen> createState() => _DetailLeaveScreenState();
}

class _DetailLeaveScreenState extends State<DetailLeaveScreen> {
  @override
  Widget build(BuildContext context) {
    Leave? args;
    if (ModalRoute.of(context)!.settings.arguments != null) {
      args = ModalRoute.of(context)!.settings.arguments as Leave;
    }
    return DetailLeaveView(leave: args!);
  }
}

class DetailLeaveView extends StatelessWidget with WidgetMixin {
  final Leave leave;

  DetailLeaveView({Key? key, required this.leave}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Cuti"),
      ),
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
                            title: "Tgl Mulai", value: leave.startDate ?? "-"),
                      ),
                      StatusCard(status: leave.status ?? "-")
                    ],
                  ),
                  TitleValueWidget(
                    title: "Tgl Selesai",
                    value: leave.endDate ?? "-",
                  ),
                  TitleValueWidget(
                    title: "Deskripsi",
                    value: leave.reasons ?? "-",
                  ),
                  TitleValueWidget(
                    title: "Catatan",
                    value: leave.note ?? "-",
                  ),
                  TitleValueWidget(
                    title: "Tgl Pengajuan",
                    value: leave.createdAt ?? "-",
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
