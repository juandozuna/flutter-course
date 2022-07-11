/*
 * JUAN OZUNA Copyright (c) 2022.
 */

import 'dart:io';
import 'dart:typed_data';

abstract class FileRepository {
  Future<String> saveFile(File file);

  Future<Uint8List?> getFile(String path);
}
