import 'package:flutter/material.dart';
import 'package:hrd/src/common/common.dart';
import 'package:hrd/src/common/mixin/status_mixin.dart';

class ReportCard extends StatelessWidget with StatusMixin, WidgetMixin {
  final String title;
  final String value;
  final String status;

   ReportCard({
    Key? key,
    required this.title,
    required this.value,
    required this.status,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
        color: DartdroidColor.white,
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: DartDroidFonts.bold(fontSize: 16),
                ),
                Text(
                  value,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: DartDroidFonts.normal(fontSize: 14),
                ),
              ],
            ),
          ),
          horizontalSpace20,
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
            decoration: BoxDecoration(
              color: statusBackgroundColor(status),
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            child: Text(
              status,
              style: DartDroidFonts.bold(
                fontSize: 14,
                color: statusTextColor(status),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
