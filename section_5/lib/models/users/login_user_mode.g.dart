// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_user_mode.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginUserModel _$LoginUserModelFromJson(Map<String, dynamic> json) =>
    LoginUserModel(
      email: json['email'] as String,
      password: json['password'] as String?,
    );

Map<String, dynamic> _$LoginUserModelToJson(LoginUserModel instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
    };
