import 'dart:io';

Future<File> findFile() async {

  File file;

  while (true) {
    // Ask user
    print('What is the location of the executable?');
    var input = stdin.readLineSync();

    // Try again if user didn't input anything
    if (input == null || input.isEmpty) continue;

    file = File(input);

    if (await file.exists()) break; // Go on if the file was found

    // Otherwise give feedback that the file wasn't found
    print('Couldn\'t find a file at ${file.absolute.path}');
  }

  // Confirm it has been found
  print('Found "${file.path}"');

  return file;
}