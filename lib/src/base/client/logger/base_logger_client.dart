abstract class BaseLoggerClient {
  void write({
    required String tag,
    required String className,
    required String message,
    String functionName = '-',
    dynamic exception = '-',
    dynamic stackTrace = '-',
    @Deprecated('Please consider use [sendToServer] parameter. Starts from v1.1.0 it is doing nothing, it is not deleted to avoid breaking changes')
        bool sendCrashlytics = true,
    bool sendToServer = true,
  });
}
