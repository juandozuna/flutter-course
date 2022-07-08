/*
 * JUAN OZUNA Copyright (c) 2022.
 */

import 'dart:io';

abstract class FileRepository {
  Future<String> saveFile(File file);
}
