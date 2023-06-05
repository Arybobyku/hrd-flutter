import 'package:flutter/material.dart';
import 'package:hrd/src/common/common.dart';

import 'logger.dart';

class LoggerClient extends BaseLoggerClient with LogMixin {
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
    bool sendToServer = false,
  }) async {
    String date = DateTime.now().toIso8601String();

    String fullMessage =
        "[$tag: $date]\n Class: $className \n Function: $functionName \n Message: $message \n Exception: $exception \n Stack trace: $stackTrace";

    logD(fullMessage);

    if (sendToServer) {
      try {
        // await sentryClient?.captureException(exception, stackTrace);
      } catch (e) {
        debugPrint('Error sending log to server : $e');
      }
    }
  }
}
