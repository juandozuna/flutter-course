// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'common_responses.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateResponse _$UpdateResponseFromJson(Map<String, dynamic> json) =>
    UpdateResponse(
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$UpdateResponseToJson(UpdateResponse instance) =>
    <String, dynamic>{
      'updatedAt': instance.updatedAt.toIso8601String(),
    };
