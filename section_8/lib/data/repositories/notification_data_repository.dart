import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:rxdart/subjects.dart';
import 'package:section_8/domain/models/notification_model.dart';
import 'package:section_8/domain/repositories/notification_repository.dart';

class NotificationDataRepository implements NotificationRepository {
  final FirebaseMessaging _messaging;
  final FlutterLocalNotificationsPlugin _localNotif;

  final BehaviorSubject<NotificationModel> _foregroundMessageSubject =
      BehaviorSubject<NotificationModel>();
  final BehaviorSubject<RemoteMessage> _backgroundMessageSubject =
      BehaviorSubject<RemoteMessage>();

  @override
  Stream<RemoteMessage> get backgroundMessages =>
      _backgroundMessageSubject.stream;

  @override
  Stream<NotificationModel> get foregroundMessages =>
      _foregroundMessageSubject.stream;

  NotificationDataRepository(this._messaging, this._localNotif);

  @override
  Future<String?> getToken() async {
    _listenToNotifications();
    await _initializeLocalNotification();
    return _messaging.getToken();
  }

  Future<void> _initializeLocalNotification() async {
    _localNotif.initialize(
      InitializationSettings(
        android: AndroidInitializationSettings('@mipmap/ic_launcher'),
        iOS: IOSInitializationSettings(
          requestSoundPermission: true,
          requestBadgePermission: true,
          requestAlertPermission: true,
        ),
      ),
      onSelectNotification: (payload) async {
        print('notification payload: $payload');

        if (payload == null) return;

        final model = NotificationModel.fromJson(json.decode(payload));
        _foregroundMessageSubject.add(model);
      },
    );
  }

  void _listenToNotifications() {
    FirebaseMessaging.onMessage.listen((event) {
      sendLocalNotification(NotificationModel.fromRemoteMessage(event));
    });

    FirebaseMessaging.onMessageOpenedApp.listen((event) {
      _backgroundMessageSubject.add(event);
    });
  }

  @override
  Future<RemoteMessage?> getInitialMessage() {
    return _messaging.getInitialMessage();
  }

  void sendLocalNotification(NotificationModel message) async {
    const androidDetails = AndroidNotificationDetails(
      'main',
      'Main',
      importance: Importance.max,
      priority: Priority.high,
    );

    const notifDetails = NotificationDetails(android: androidDetails);

    await _localNotif.show(
      0,
      message.title,
      message.body ?? "",
      notifDetails,
      payload: jsonEncode(message.toJson()),
    );
  }
}
