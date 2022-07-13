/*
 * JUAN OZUNA Copyright (c) 2022.
 */

import 'dart:io';

import 'package:section_8/domain/enums/chat_image_source.dart';

abstract class ImageService {
  Future<File?> pickPicture(ChatImageSource source);
}
