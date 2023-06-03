import 'package:flutter/material.dart';
import 'package:hrd/src/common/mixin/status_mixin.dart';
import 'package:hrd/src/common/utility/dartdroid_fonts.dart';

class StatusCard extends StatelessWidget with StatusMixin{
  StatusCard({Key? key, required this.status}) : super(key: key);
  final String status;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 2),
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
    );
  }
}
