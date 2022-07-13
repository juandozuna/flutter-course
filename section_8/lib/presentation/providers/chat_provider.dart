import 'dart:typed_data';

import 'package:section_8/domain/enums/chat_image_source.dart';
import 'package:section_8/domain/models/chat_message_model.dart';
import 'package:section_8/domain/repositories/auth_repository.dart';
import 'package:section_8/domain/repositories/chat_repository.dart';
import 'package:section_8/domain/repositories/file_repository.dart';
import 'package:section_8/domain/service/image_service.dart';
import 'package:section_8/presentation/providers/base_notifier_provider.dart';

class ChatProvider extends BaseNotifierProvider {
  final AuthRepository _authRepository;
  final ChatRepository _chatRepository;
  final ImageService _imageService;
  final FileRepository _fileRepository;

  Stream<List<ChatMessageModel>> get messages => _chatRepository.messages;

  ChatProvider(
    this._authRepository,
    this._chatRepository,
    this._imageService,
    this._fileRepository,
  );

  void sendMessage(String message) {
    _chatRepository.sendMessage(message);
  }

  Future<bool> isMessageMe(ChatMessageModel message) async {
    final user = await _authRepository.getUser();
    return user!.email! == message.sender;
  }

  void startListeningToMessages() {
    _chatRepository.listenForMessages();
  }

  void stopListeningToMessages() {
    _chatRepository.stopListeningToMessages();
  }

  void sendPictureMessage(String message, ChatImageSource imageSource) async {
    startLoading();
    final file = await _imageService.pickPicture(imageSource);
    if (file == null) {
      return;
    }

    final url = await _fileRepository.saveFile(file);

    await _chatRepository.sendPictureMessage(message, url);
    stopLoading();
  }

  Future<Uint8List?> getImage(String path) async {
    return _fileRepository.getFile(path);
  }
}
