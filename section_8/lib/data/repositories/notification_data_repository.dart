import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:rxdart/subjects.dart';
import 'package:section_8/domain/repositories/notification_repository.dart';

class NotificationDataRepository implements NotificationRepository {
  final FirebaseMessaging _messaging;
  final FlutterLocalNotificationsPlugin _localNotif;

  final BehaviorSubject<String> _foregroundMessageSubject =
      BehaviorSubject<String>();
  final BehaviorSubject<RemoteMessage> _backgroundMessageSubject =
      BehaviorSubject<RemoteMessage>();

  @override
  Stream<RemoteMessage> get backgroundMessages =>
      _backgroundMessageSubject.stream;

  @override
  Stream<String> get foregroundMessages => _foregroundMessageSubject.stream;

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
        _foregroundMessageSubject.add(payload ?? '');
      },
    );
  }

  void _listenToNotifications() {
    FirebaseMessaging.onMessage.listen((event) {
      sendLocalNotification(event);
    });

    FirebaseMessaging.onMessageOpenedApp.listen((event) {
      _backgroundMessageSubject.add(event);
    });
  }

  @override
  Future<RemoteMessage?> getInitialMessage() {
    return _messaging.getInitialMessage();
  }

  void sendLocalNotification(RemoteMessage message) async {
    const androidDetails = AndroidNotificationDetails(
      'main',
      'Main',
      importance: Importance.max,
      priority: Priority.high,
    );

    const notifDetails = NotificationDetails(android: androidDetails);

    await _localNotif.show(
      0,
      message.notification!.title,
      message.notification!.body,
      notifDetails,
      payload: message.notification!.title,
    );
  }
}
