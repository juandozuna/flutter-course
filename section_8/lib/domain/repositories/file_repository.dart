/*
 * JUAN OZUNA Copyright (c) 2022.
 */

import 'dart:io';
import 'dart:typed_data';

abstract class FileRepository {
  Future<String> saveFile(File file);

  Future<String> saveFileFromBytes(Uint8List bytes);

  Future<Uint8List?> getFile(String path);
}
