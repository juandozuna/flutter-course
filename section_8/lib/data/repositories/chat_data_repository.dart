import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rxdart/src/streams/value_stream.dart';
import 'package:rxdart/subjects.dart';
import 'package:section_8/domain/repositories/auth_repository.dart';
import 'package:section_8/domain/repositories/chat_repository.dart';
import 'package:section_8/models/chat_message_model.dart';

class ChatDataRepository implements ChatRepository {
  final AuthRepository _authRepository;
  final FirebaseFirestore _firestore;

  late StreamSubscription<Object>? _messageSubscription;
  BehaviorSubject<List<ChatMessageModel>> _messagesSubject =
      BehaviorSubject<List<ChatMessageModel>>.seeded([]);

  @override
  ValueStream<List<ChatMessageModel>> get messages => _messagesSubject.stream;

  CollectionReference get _chatRef =>
      _firestore.collection('chat').withConverter<ChatMessageModel>(
            fromFirestore: (snapshot, _) => ChatMessageModel.fromJson(
              snapshot.data()!,
            ),
            toFirestore: (model, _) => model.toJson(),
          );

  ChatDataRepository(this._authRepository, this._firestore);

  @override
  Future<void> listenForMessages() async {
    final stream = _chatRef.snapshots();
    final subscription = stream.listen((snapshot) {
      final messages =
          snapshot.docs.map((doc) => doc.data()! as ChatMessageModel).toList();
      _messagesSubject.add(messages);
    });
    _messageSubscription = subscription;
  }

  @override
  Future<void> sendMessage(String message) async {
    final user = (await _authRepository.getUser())!;
    final model = ChatMessageModel(
      message: message,
      sender: user.email!,
      timestamp: DateTime.now(),
    );
    await _chatRef.add(model);
  }

  @override
  Future<void> stopListeningToMessages() async {
    _messageSubscription?.cancel();
    _messageSubscription = null;
  }
}
