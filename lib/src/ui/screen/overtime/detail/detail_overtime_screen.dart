import 'package:flutter/material.dart';
import 'package:hrd/src/common/common.dart';

class DetailOvertimeScreen extends StatefulWidget {
  const DetailOvertimeScreen({Key? key}) : super(key: key);

  @override
  State<DetailOvertimeScreen> createState() => _DetailOvertimeScreenState();
}

class _DetailOvertimeScreenState extends State<DetailOvertimeScreen> {
  @override
  Widget build(BuildContext context) {
    return  DetailOvertimeView();
  }
}

class DetailOvertimeView extends StatelessWidget with WidgetMixin{
  DetailOvertimeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

