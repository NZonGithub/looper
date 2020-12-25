import 'dart:io';

// Loops the execution of a file
class Looper {

  final File exec;
  final List<String> args;

  Process _process;
  bool _run = true;

  Looper(this.exec, List<String> args) : args = List.unmodifiable(args);

  bool get isRunning => _run;

  void start() async {
    _run = true;
    _loop();
  }

  void stop() {
    _run = false;
  }

  void toggle() {
    if (_run) {
      stop();
    } else {
      start();
    }
  }

  void _loop() async {

    // Run while looper is enabled and process isn't already running.
    while (_run && _process == null) {

      print('\nStarting ${exec.path}');
      _process = await Process.start(exec.path, args);

      await _process.exitCode;
      print('Process closed');

      _process = null;
    }
  }
}