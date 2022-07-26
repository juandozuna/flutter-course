import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:section_8/domain/models/notification_model.dart';

abstract class NotificationRepository {
  Future<String?> getToken();

  Future<RemoteMessage?> getInitialMessage();
  Stream<NotificationModel> get foregroundMessages;
  Stream<RemoteMessage> get backgroundMessages;
}
