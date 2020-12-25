import 'dart:convert';
import 'dart:io';

import 'looper.dart';
import 'finder.dart';

void main(List<String> args) async {

  print('You can close this program by alt-tabbing.');
  print('Remember to close the started program afterwards.');
  print('\nTip: you can drag the file in this window and then press enter to enter the location.');

  // Find executable using user input. Only works on windows.
  var mrKrabsExec = await findFile();
  var looper = Looper(mrKrabsExec, args)..start();
  
  // Loop
  var lines = stdin
    .transform(Utf8Decoder())
    .transform(LineSplitter());

  await lines.forEach((line) {
    looper.toggle();

    if (looper.isRunning) {
      print('Enabled looper (Press enter in console to toggle)');
    } else {
      print('Disabled looper (Press enter in console to toggle)');
    }
  });

}