import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'login_user_mode.g.dart';

@JsonSerializable()
class LoginUserModel extends Equatable {
  final String email;
  final String? password;

  const LoginUserModel({
    required this.email,
    this.password,
  });

  factory LoginUserModel.fromJson(Map<String, dynamic> json) =>
      _$LoginUserModelFromJson(json);

  Map<String, dynamic> toJson() => _$LoginUserModelToJson(this);

  @override
  List<Object?> get props => [email, password];

  @override
  bool get stringify => true;
}

@JsonSerializable()
class TokenResponse extends Equatable {
  final String token;

  const TokenResponse({
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
