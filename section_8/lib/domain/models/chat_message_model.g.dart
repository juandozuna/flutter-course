// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_message_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatMessageModel _$ChatMessageModelFromJson(Map<String, dynamic> json) =>
    ChatMessageModel(
      message: json['message'] as String,
      sender: json['sender'] as String,
      timestamp: DateTime.parse(json['timestamp'] as String),
      location: json['location'] == null
          ? null
          : DeviceLocation.fromJson(json['location'] as Map<String, dynamic>),
      geocoded: json['geocoded'] == null
          ? null
          : GeocodedLocation.fromJson(json['geocoded'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ChatMessageModelToJson(ChatMessageModel instance) {
  final val = <String, dynamic>{
    'message': instance.message,
    'sender': instance.sender,
    'timestamp': instance.timestamp.toIso8601String(),
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('location', instance.location?.toJson());
  writeNotNull('geocoded', instance.geocoded?.toJson());
  return val;
}