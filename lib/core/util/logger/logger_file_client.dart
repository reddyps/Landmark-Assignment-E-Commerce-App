import 'dart:io';
import 'dart:developer' as developer;
import 'package:landmark_assignment/core/util/value/constants.dart';
import 'package:logger/logger.dart';
import 'package:path_provider/path_provider.dart';

class LoggerFileClient extends LogOutput {
  late File _logFile;
  IOSink? _logSink;

  Future<void> start() async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String logFilePath = '${appDocDir.path}/${Constants.appName}_app_logs.txt';
    _logFile = File(logFilePath);

    // Create an IOSink to write to the file
    _logSink = _logFile.openWrite(mode: FileMode.append);
    developer.registerExtension(
      'ext.flutter.logs',
      (String method, Map<dynamic, dynamic> params) {
        if (method == 'sendLog') {
          String message = params['message'];
          _logSink?.writeln(message);
        }
        return Future.value(
          developer.ServiceExtensionResponse.result('{}'),
        );
      },
    );
  }

  @override
  void output(OutputEvent event) {
    for (var line in event.lines) {
      _logSink?.writeln(line);
    }
  }

  void close() {
    _logSink?.close();
  }
}
