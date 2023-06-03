import 'package:flutter/material.dart';
import 'package:hrd/src/common/extension/date_time_extension.dart';

import '../../common/common.dart';
import '../ui.dart';

class AttendanceCard extends StatelessWidget with WidgetMixin {
  AttendanceCard({
    Key? key,
    this.shift,
    this.organizationHierarchy,
    this.attendance,
    this.onTapClockIn,
    this.onTapClockOut,
  }) : super(key: key);

  final Shift? shift;
  final OrganizationHierarchy? organizationHierarchy;
  final Attendance? attendance;
  final Function()? onTapClockIn;
  final Function()? onTapClockOut;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
        color: DartdroidColor.white,
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Text(
                  "Jadwal Kerja",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: DartDroidFonts.bold(),
                ),
              ),
              Expanded(
                child: Text(
                  DateTime.now().generalFormatDate,
                  maxLines: 1,
                  textAlign: TextAlign.end,
                  overflow: TextOverflow.ellipsis,
                  style: DartDroidFonts.normal(),
                ),
              ),
            ],
          ),
          verticalSpace(12),
          Text(
            "${shift?.schedulein ?? "-"} - ${shift?.scheduleout ?? "-"}",
            style: DartDroidFonts.bold(
              fontSize: 20,
            ),
          ),
          verticalSpace(2),
          Text(
            "Jam Kerja",
            maxLines: 1,
            textAlign: TextAlign.end,
            overflow: TextOverflow.ellipsis,
            style: DartDroidFonts.normal(
              fontSize: 14,
            ),
          ),
          divider(),
          Row(
            children: [
              const Icon(
                Icons.location_pin,
                color: DartdroidColor.redDarken40,
              ),
              horizontalSpace(5),
              Expanded(
                child: Text(
                  organizationHierarchy?.name ?? "-",
                  style: DartDroidFonts.normal(
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          ),
          divider(),
          if (attendance?.status != null)
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                StatusCard(status: attendance?.status ?? "-"),
                verticalSpace10,
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        "Absensi Masuk",
                        style: DartDroidFonts.normal(fontSize: 14),
                      ),
                    ),
                    Text(
                      attendance?.clockinTime ?? "-",
                      style: DartDroidFonts.normal(fontSize: 14),
                    ),
                  ],
                ),
                verticalSpace5,
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        "Absensi Keluar",
                        style: DartDroidFonts.normal(fontSize: 14),
                      ),
                    ),
                    Text(
                      attendance?.clockoutTime ?? "-",
                      style: DartDroidFonts.normal(fontSize: 14),
                    ),
                  ],
                ),
                divider(),
              ],
            ),
          Row(
            children: [
              Expanded(
                child: DisablerWidget(
                  disable: !(attendance?.clockinTime == null),
                  child: ButtonRounded(
                    text: "Masuk",
                    borderRadius: 5,
                    fontWeight: FontWeight.normal,
                    onPressed: onTapClockIn,
                  ),
                ),
              ),
              horizontalSpace20,
              Expanded(
                child: DisablerWidget(
                  disable: !(attendance?.clockinTime != null &&
                      attendance?.clockoutTime == null),
                  child: ButtonRounded(
                    text: "Keluar",
                    borderRadius: 5,
                    backgroundColor: DartdroidColor.redDarken40,
                    fontWeight: FontWeight.normal,
                    onPressed: onTapClockOut,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
