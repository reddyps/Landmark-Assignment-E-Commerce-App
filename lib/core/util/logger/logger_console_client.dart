import 'package:logger/logger.dart';

class LoggerConsoleClient {
  LoggerConsoleClient._privateConstructor();

  static final LoggerConsoleClient _instance =
      LoggerConsoleClient._privateConstructor();

  static LoggerConsoleClient get instance => _instance;

  final client = Logger(
    printer: PrettyPrinter(
      methodCount: 0,
      printEmojis: false,
      noBoxingByDefault : true
    ),
  );
}
