const loggerService = """
import 'package:logger/logger.dart';

class LoggerService {
  static final _logger = Logger(
    printer: PrettyPrinter(
      methodCount: 0,
      errorMethodCount: 2,
    ),
  );

  static warning(String message, {String? title}) {
    _logger.w(message, error: title);
  }

  static debug(String message, {String? title}) {
    _logger.d(message, error: title);
  }

  static info(String message, {String? title}) {
    _logger.i(message, error: title);
  }

  static error(String message, {String? title}) {
    _logger.e(message, error: title);
  }
}
""";