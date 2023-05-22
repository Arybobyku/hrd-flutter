import 'package:flutter/material.dart';

class DisablerWidget extends StatelessWidget {
  final bool disable;
  final Widget child;

  const DisablerWidget({
    Key? key,
    this.disable = false,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      key: key,
      ignoring: disable,
      child: Opacity(
        opacity: disable ? 0.4 : 1.0,
        child: child,
      ),
    );
  }
}