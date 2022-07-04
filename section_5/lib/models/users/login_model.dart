import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'login_model.g.dart';

@JsonSerializable()
class LoginUserRequest extends Equatable {
  final String email;
  final String? password;

  LoginUserRequest({
    required this.email,
    this.password,
  });

  factory LoginUserRequest.fromJson(Map<String, dynamic> json) =>
      _$LoginUserRequestFromJson(json);

  Map<String, dynamic> toJson() => _$LoginUserRequestToJson(this);

  @override
  List<Object?> get props => [email, password];

  @override
  bool get stringify => true;
}

@JsonSerializable()
class TokenResponse extends Equatable {
  final String token;

  TokenResponse({
    required this.token,
  });

  factory TokenResponse.fromJson(Map<String, dynamic> json) =>
      _$TokenResponseFromJson(json);

  Map<String, dynamic> toJson() => _$TokenResponseToJson(this);

  @override
  List<Object?> get props => [token];

  @override
  bool get stringify => true;
}
