import 'package:firebase_messaging/firebase_messaging.dart';

abstract class NotificationRepository {
  Future<String?> getToken();

  Future<RemoteMessage?> getInitialMessage();
  Stream<String> get foregroundMessages;
  Stream<RemoteMessage> get backgroundMessages;
}
