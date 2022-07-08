import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'chat_message_model.g.dart';

@JsonSerializable()
class ChatMessageModel extends Equatable {
  final String message;
  final String sender;
  final DateTime timestamp;

  ChatMessageModel({
    required this.message,
    required this.sender,
    required this.timestamp,
  });

  factory ChatMessageModel.fromJson(Map<String, dynamic> json) =>
      _$ChatMessageModelFromJson(json);

  Map<String, dynamic> toJson() => _$ChatMessageModelToJson(this);

  @override
  List<Object> get props => [message, sender, timestamp];

  @override
  bool get stringify => true;
}
