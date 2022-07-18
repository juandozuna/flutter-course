import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:section_8/domain/models/location_model.dart';

part 'chat_message_model.g.dart';

enum ChatMessageType {
  @JsonValue('Text')
  text,
  @JsonValue('Picture')
  picture,
  @JsonValue('Location')
  location,
}

@JsonSerializable(includeIfNull: false, explicitToJson: true)
class ChatMessageModel extends Equatable {
  final String message;
  final String sender;
  final DateTime timestamp;
  final ChatMessageType type;
  final DeviceLocation? location;
  final GeocodedLocation? geocoded;
  final String? fileLocation;

  ChatMessageModel({
    required this.message,
    required this.sender,
    required this.timestamp,
    required this.type,
    required this.location,
    required this.geocoded,
    required this.fileLocation,
  });

  factory ChatMessageModel.fromJson(Map<String, dynamic> json) =>
      _$ChatMessageModelFromJson(json);

  Map<String, dynamic> toJson() => _$ChatMessageModelToJson(this);

  ChatMessageModel copyWith({
    String? message,
    String? sender,
    DateTime? timestamp,
    ChatMessageType? type,
    DeviceLocation? location,
    GeocodedLocation? geocoded,
    String? fileLocation,
  }) {
    return ChatMessageModel(
      message: message ?? this.message,
      sender: sender ?? this.sender,
      timestamp: timestamp ?? this.timestamp,
      type: type ?? this.type,
      location: location ?? this.location,
      geocoded: geocoded ?? this.geocoded,
      fileLocation: fileLocation ?? this.fileLocation,
    );
  }

  @override
  List<Object?> get props => [
        message,
        sender,
        timestamp,
        type,
        location,
        geocoded,
        fileLocation,
      ];

  @override
  bool get stringify => true;
}
