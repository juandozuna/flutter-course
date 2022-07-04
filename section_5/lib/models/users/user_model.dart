import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel extends Equatable {
  final int id;

  final String email;

  @JsonKey(name: 'first_name')
  final String firstName;

  @JsonKey(name: 'last_name')
  final String lastName;

  final String? avatar;

  const UserModel({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.avatar,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  @override
  List<Object?> get props => [
        id,
        email,
        firstName,
        lastName,
        avatar,
      ];

  @override
  bool get stringify => true;
}

@JsonSerializable()
class UserPagingResponse extends Equatable {
  final int page;

  @JsonKey(name: 'per_page')
  final int perPage;

  final int total;

  @JsonKey(name: 'total_pages')
  final int totalPages;

  final List<UserModel> data;

  const UserPagingResponse({
    required this.page,
    required this.perPage,
    required this.total,
    required this.totalPages,
    required this.data,
  });

  factory UserPagingResponse.fromJson(Map<String, dynamic> json) =>
      _$UserPagingResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UserPagingResponseToJson(this);

  @override
  List<Object?> get props => [
        page,
        perPage,
        total,
        totalPages,
        data,
      ];

  @override
  bool get stringify => true;
}
