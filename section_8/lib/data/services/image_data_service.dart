/*
 * JUAN OZUNA Copyright (c) 2022.
 */

import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:section_8/domain/enums/chat_image_source.dart';
import 'package:section_8/domain/service/image_service.dart';

class ImageDataService implements ImageService {
  final ImagePicker _picker;

  ImageDataService(this._picker);

  @override
  Future<File?> pickPicture(ChatImageSource source) {
    switch (source) {
      case ChatImageSource.camera:
        return _pickImage(ImageSource.camera);
      case ChatImageSource.gallery:
        return _pickImage(ImageSource.gallery);
      default:
        return Future.value(null);
    }
  }

  Future<File?> _pickImage(ImageSource source) async {
    final image = await _picker.pickImage(source: ImageSource.gallery);
    if (image == null) {
      return null;
    }
    return File(image.path);
  }
}
