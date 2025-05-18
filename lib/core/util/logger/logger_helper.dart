import 'package:landmark_assignment/core/util/value/constants.dart';
import 'package:landmark_assignment/core/util/logger/logger_console_client.dart';
import 'package:landmark_assignment/core/util/extension/method_extension.dart';

void logD({String? tag, required String message}) {
  final client = LoggerConsoleClient.instance.client;
  if (Constants.isLogsEnabled) {
    print('${tag.isNullOrEmpty() ? '' : tag}${tag.isNullOrEmpty() ? '' : ': '}$message');
  }
}

void logV({String? tag, required String message}) {
  final client = LoggerConsoleClient.instance.client;
  if (Constants.isLogsEnabled) {
    client.t(
        '${tag.isNullOrEmpty() ? '' : tag}${tag.isNullOrEmpty() ? '' : ': '}$message');
  }
}

void loge({String? tag, required String message}) {
  final client = LoggerConsoleClient.instance.client;
  if (Constants.isLogsEnabled) {
    client.e(
        '${tag.isNullOrEmpty() ? '' : tag}${tag.isNullOrEmpty() ? '' : ': '}$message');
  }
}

void logC({String? tag, required String message}) {
  final client = LoggerConsoleClient.instance.client;
  if (Constants.isLogsEnabled) {
    client.f(
        '${tag.isNullOrEmpty() ? '' : tag}${tag.isNullOrEmpty() ? '' : ': '}$message');
  }
}

void logI({String? tag, required String message}) {
  final client = LoggerConsoleClient.instance.client;
  if (Constants.isLogsEnabled) {
    client.i(
        '${tag.isNullOrEmpty() ? '' : tag}${tag.isNullOrEmpty() ? '' : ': '}$message');
  }
}
