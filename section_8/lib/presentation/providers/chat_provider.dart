import 'package:section_8/domain/models/chat_message_model.dart';
import 'package:section_8/domain/repositories/auth_repository.dart';
import 'package:section_8/domain/repositories/chat_repository.dart';
import 'package:section_8/presentation/providers/base_notifier_provider.dart';

class ChatProvider extends BaseNotifierProvider {
  final AuthRepository _authRepository;
  final ChatRepository _chatRepository;

  Stream<List<ChatMessageModel>> get messages => _chatRepository.messages;

  ChatProvider(this._authRepository, this._chatRepository);

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
}
