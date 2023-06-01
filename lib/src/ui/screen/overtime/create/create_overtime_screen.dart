import 'package:flutter/material.dart';
import 'package:hrd/src/common/common.dart';

class CreateOvertimeScreen extends StatefulWidget {
  const CreateOvertimeScreen({Key? key}) : super(key: key);

  @override
  State<CreateOvertimeScreen> createState() => _CreateOvertimeScreenState();
}

class _CreateOvertimeScreenState extends State<CreateOvertimeScreen> {
  @override
  Widget build(BuildContext context) {
    return CreateOvertimeView();
  }
}

class CreateOvertimeView extends StatelessWidget with WidgetMixin{
  CreateOvertimeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

