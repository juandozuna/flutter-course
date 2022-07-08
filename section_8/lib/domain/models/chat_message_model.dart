import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:section_8/domain/models/location_model.dart';

part 'chat_message_model.g.dart';

@JsonSerializable()
class ChatMessageModel extends Equatable {
  final String message;
  final String sender;
  final DateTime timestamp;
  final DeviceLocation? location;

  ChatMessageModel({
    required this.message,
    required this.sender,
    required this.timestamp,
    this.location,
  });

  factory ChatMessageModel.fromJson(Map<String, dynamic> json) =>
      _$ChatMessageModelFromJson(json);

  Map<String, dynamic> toJson() => _$ChatMessageModelToJson(this);

  @override
  List<Object> get props => [message, sender, timestamp];

  @override
  bool get stringify => true;
}
