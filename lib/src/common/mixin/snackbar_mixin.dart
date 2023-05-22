import 'package:flutter/material.dart';

mixin SnackBarMessageMixin {
  showSnackBarMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          maxLines: 5,
          style: const TextStyle(
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
