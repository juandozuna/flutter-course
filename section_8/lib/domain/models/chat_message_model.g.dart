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
      type: $enumDecode(_$ChatMessageTypeEnumMap, json['type']),
      location: json['location'] == null
          ? null
          : DeviceLocation.fromJson(json['location'] as Map<String, dynamic>),
      geocoded: json['geocoded'] == null
          ? null
          : GeocodedLocation.fromJson(json['geocoded'] as Map<String, dynamic>),
      fileLocation: json['fileLocation'] as String?,
    );

Map<String, dynamic> _$ChatMessageModelToJson(ChatMessageModel instance) {
  final val = <String, dynamic>{
    'message': instance.message,
    'sender': instance.sender,
    'timestamp': instance.timestamp.toIso8601String(),
    'type': _$ChatMessageTypeEnumMap[instance.type],
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('location', instance.location?.toJson());
  writeNotNull('geocoded', instance.geocoded?.toJson());
  writeNotNull('fileLocation', instance.fileLocation);
  return val;
}

const _$ChatMessageTypeEnumMap = {
  ChatMessageType.text: 'Text',
  ChatMessageType.picture: 'Picture',
};
