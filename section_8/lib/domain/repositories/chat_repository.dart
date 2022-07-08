import 'package:rxdart/rxdart.dart';
import 'package:section_8/domain/models/chat_message_model.dart';

abstract class ChatRepository {
  ValueStream<List<ChatMessageModel>> get messages;

  Future<void> sendMessage(String message);

  Future<void> listenForMessages();

  Future<void> stopListeningToMessages();

  Future<void> sendPictureMessage(String message, String filePath);
}
