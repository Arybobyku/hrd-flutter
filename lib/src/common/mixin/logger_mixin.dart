import 'package:logger/logger.dart';

mixin LogMixin {
  final Logger logger = Logger(
    filter: ProductionFilter(),
    printer: PrettyPrinter(methodCount: 0),
    output: null,
  );

  void logI(String message) {
    logger.i(message);
  }

  void logW(String message) {
    logger.w(message);
  }

  void logE(String message) {
    logger.e(message);
  }

  void logD(String message) {
    logger.d(message);
  }

  void logV(String message) {
    logger.v(message);
  }
}
