import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'create_user_model.g.dart';

@JsonSerializable()
class CreateUserRequest extends Equatable {
  final String name;
  final String job;

  CreateUserRequest({
    required this.name,
    required this.job,
  });

  factory CreateUserRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateUserRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CreateUserRequestToJson(this);

  @override
  List<Object?> get props => [
        name,
        job,
      ];

  @override
  bool get stringify => true;
}

@JsonSerializable()
class CreateUserResponse extends Equatable {
  final String name;
  final String job;
  final String id;
  final DateTime createdAt;

  CreateUserResponse({
    required this.name,
    required this.job,
    required this.id,
    required this.createdAt,
  });

  factory CreateUserResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateUserResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CreateUserResponseToJson(this);

  @override
  List<Object?> get props => [
        name,
        job,
        id,
        createdAt,
      ];

  @override
  bool get stringify => true;
}
