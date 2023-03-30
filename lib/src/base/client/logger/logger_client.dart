import 'dart:developer';

import 'package:flutter/material.dart';

import 'logger.dart';

/// Logging to console or firebase crashlytics
class LoggerClient extends BaseLoggerClient {
  LoggerClient();

  @override
  void write({
    required String tag,
    required String className,
    required String message,
    String functionName = '-',
    dynamic exception = '-',
    dynamic stackTrace = '-',
    bool sendCrashlytics = true,
    bool sendToServer = true,
  }) async {
    String date = DateTime.now().toIso8601String();

    String fullMessage =
        "[$tag: $date]\n Class: $className \n Function: $functionName \n Message: $message \n Exception: $exception \n Stack trace: $stackTrace";

    log(fullMessage);

    if (sendToServer) {
      try {
        // await sentryClient?.captureException(exception, stackTrace);
      } catch (e) {
        debugPrint('Error sending log to server : $e');
      }
    }
  }
}
