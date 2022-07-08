// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GeocodedLocation _$GeocodedLocationFromJson(Map<String, dynamic> json) =>
    GeocodedLocation(
      displayName: json['displayName'] as String,
      neighbourhood: json['neighbourhood'] as String,
      country: json['country'] as String,
      city: json['city'] as String,
    );

Map<String, dynamic> _$GeocodedLocationToJson(GeocodedLocation instance) =>
    <String, dynamic>{
      'displayName': instance.displayName,
      'neighbourhood': instance.neighbourhood,
      'country': instance.country,
      'city': instance.city,
    };

DeviceLocation _$DeviceLocationFromJson(Map<String, dynamic> json) =>
    DeviceLocation(
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
    );

Map<String, dynamic> _$DeviceLocationToJson(DeviceLocation instance) =>
    <String, dynamic>{
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };
