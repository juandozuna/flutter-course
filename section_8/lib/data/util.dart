/*
 * JUAN OZUNA Copyright (c) 2022.
 */

import 'dart:math';

String generateRandomString([int length = 10]) {
  final random = Random();
  final codeUnits = List.generate(length, (index) {
    return random.nextInt(33) + 89;
  });
  return String.fromCharCodes(codeUnits);
}
