import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'common_responses.g.dart';

@JsonSerializable()
class UpdateResponse extends Equatable {
  final DateTime updatedAt;

  UpdateResponse({
    required this.updatedAt,
  });

  @override
  List<Object> get props => [updatedAt];

  factory UpdateResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateResponseToJson(this);

  @override
  bool get stringify => true;
}
