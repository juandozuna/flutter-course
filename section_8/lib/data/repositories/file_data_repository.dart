/*
 * JUAN OZUNA Copyright (c) 2022.
 */

import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:section_8/domain/repositories/file_repository.dart';

class FileDataRepository implements FileRepository {
  final FirebaseStorage _storage;

  Reference get _chatRef => _storage.ref().child('chat');

  FileDataRepository(this._storage);

  @override
  Future<String> saveFile(File file) async {
    final result = await _chatRef.putFile(file);
    return result.metadata?.fullPath ?? '';
  }
}
