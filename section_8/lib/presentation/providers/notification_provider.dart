import 'package:flutter/material.dart';
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
  }

  Future<void> _handleBackground() async {
    final initialMessage = await _notificationRepository.getInitialMessage();

    if (initialMessage != null) {
      _routeUser(initialMessage);
      return;
    }

    _notificationRepository.backgroundMessages.listen((event) {
      _routeUser(event);
    });
  }

  void _routeUser(dynamic message) {
    final state = _navKey.currentState!;

    state.pushNamed(AppRoute.notifExample, arguments: message);
  }
}
