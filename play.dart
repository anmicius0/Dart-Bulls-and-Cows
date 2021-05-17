import 'dart:math';
import 'dart:io';

import 'package:validators/validators.dart';

main() {
  // Generate a ranbom 4 digit number as String
  Random random = new Random();
  String answer = (random.nextInt(8999) + 1000).toString();

  String? guess;
  do {
    // Generate result
    if (guess != null) {
      List<int> result = generateResult(answer, guess);
      print("${result[0]}A${result[1]}B");
    }

    while (true) {
      stdout.write("Take a guess: ");
      guess = stdin.readLineSync();

      if (validate(guess!)) {
        break;
      } else {
        print("Invalid Input!");
      }
    }
  } while (guess != answer);

  // End game
  print("Congradulation");
}

List<int> generateResult(String answer, String guess) {
  /// Compare answer and guess, return the reuslt
  List<int> result = [0, 0];
  // Check a
  for (int i = 0; i < answer.length; i++) {
    if (answer[i] == guess[i]) {
      result[0]++;
    }
  }

  // Check b
  List<String> answerList = answer.split('');
  for (int i = 0; i < guess.length; i++) {
    // If it's in the list
    if (answerList.contains(guess[i])) {
      // Remove it
      answerList.remove(guess[i]);
      result[1]++;
    }
  }

  return result;
}

bool validate(String guess) {
  if (guess.length != 4) {
    return false;
  }

  if (!isNumeric(guess)) {
    return false;
  }

  return true;
}
