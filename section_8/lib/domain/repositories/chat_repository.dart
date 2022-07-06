import 'package:cloud_firestore/cloud_firestore.dart';

abstract class ChatRepository {
  Future<void> sendMessage(String message);

  Future<void> listenForMessages();
}
