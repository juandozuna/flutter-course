/*
 * JUAN OZUNA Copyright (c) 2022.
 */

import 'dart:io';
import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:section_8/data/util.dart';
import 'package:section_8/domain/repositories/file_repository.dart';

class FileDataRepository implements FileRepository {
  final FirebaseStorage _storage;

  Reference get _chatRef => _storage.ref().child('chat');

  FileDataRepository(this._storage);

  @override
  Future<String> saveFile(File file) async {
    final randString = DateTime.now().millisecondsSinceEpoch.toString();
    final result = await _chatRef.child(randString).putFile(file);
    return result.metadata?.fullPath ?? '';
  }

  @override
  Future<Uint8List?> getFile(String path) {
    final ref = _storage.ref(path);
    return ref.getData();
  }

  @override
  Future<String> saveFileFromBytes(Uint8List bytes) async {
    final randString = DateTime.now().millisecondsSinceEpoch.toString();
    final result = await _chatRef.child(randString).putData(bytes);
    return result.metadata?.fullPath ?? '';
  }
}
