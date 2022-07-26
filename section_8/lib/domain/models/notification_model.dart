import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:json_annotation/json_annotation.dart';

part 'notification_model.g.dart';

@JsonSerializable()
class NotificationModel {
  final String title;
  final String? body;
  final Map<String, dynamic>? data;

  NotificationModel({
    required this.title,
    this.body,
    this.data,
  });

  static NotificationModel fromRemoteMessage(RemoteMessage message) {
    return NotificationModel(
      title: message.notification?.title ?? "",
      body: message.notification?.body,
      data: message.data,
    );
  }

  factory NotificationModel.fromJson(Map<String, dynamic> json) =>
      _$NotificationModelFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationModelToJson(this);
}
