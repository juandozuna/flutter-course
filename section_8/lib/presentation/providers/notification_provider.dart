import 'package:flutter/material.dart';
import 'package:section_8/domain/models/notification_model.dart';
import 'package:section_8/domain/repositories/notification_repository.dart';
import 'package:section_8/presentation/constants/routes.dart';

class NotificationProvider {
  final NotificationRepository _notificationRepository;
  final GlobalKey<NavigatorState> _navKey;

  NotificationProvider(
    this._notificationRepository,
    this._navKey,
  );

  void handleNotifications() {
    _handleBackground();
    _handleForeground();
  }

  void _handleForeground() {
    _notificationRepository.foregroundMessages.listen((message) {
      _routeUser(message);
    });
  }

  Future<void> _handleBackground() async {
    final initialMessage = await _notificationRepository.getInitialMessage();

    if (initialMessage != null) {
      _routeUser(NotificationModel.fromRemoteMessage(initialMessage));
      return;
    }

    _notificationRepository.backgroundMessages.listen((event) {
      _routeUser(NotificationModel.fromRemoteMessage(event));
    });
  }

  void _routeUser(NotificationModel message) {
    final type = message.data!['type'];
    final state = _navKey.currentState!;

    if (type == 'UPDATED') {
      state.pushNamed(AppRoute.updated, arguments: message);
      return;
    }

    if (type == 'COURSE') {
      state.pushNamed(AppRoute.course, arguments: message);
      return;
    }

    if (type == 'CHAT') {
      state.pushNamed(AppRoute.chat, arguments: message);
      return;
    }

    state.pushNamed(AppRoute.notifExample, arguments: message);
  }
}
