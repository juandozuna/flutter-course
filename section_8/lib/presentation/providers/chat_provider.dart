import 'package:section_8/domain/repositories/auth_repository.dart';
import 'package:section_8/domain/repositories/chat_repository.dart';
import 'package:section_8/presentation/providers/base_notifier_provider.dart';

class ChatProvider extends BaseNotifierProvider {
  final AuthRepository _authRepository;
  final ChatRepository _chatRepository;

  ChatProvider(this._authRepository, this._chatRepository);
}
