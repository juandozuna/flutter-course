/*
 * JUAN OZUNA Copyright (c) 2022.
 */

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'location_model.g.dart';

@JsonSerializable(includeIfNull: false)
class GeocodedLocation extends Equatable {
  final String displayName;
  final String neighbourhood;
  final String country;
  final String city;

  GeocodedLocation({
    required this.displayName,
    required this.neighbourhood,
    required this.country,
    required this.city,
  });

  factory GeocodedLocation.fromJson(Map<String, dynamic> json) =>
      _$GeocodedLocationFromJson(json);

  Map<String, dynamic> toJson() => _$GeocodedLocationToJson(this);

  @override
  List<Object> get props => [
        displayName,
        neighbourhood,
        country,
        city,
      ];

  @override
  bool get stringify => true;
}

@JsonSerializable(includeIfNull: false)
class DeviceLocation extends Equatable {
  final double latitude;
  final double longitude;

  DeviceLocation({
    required this.latitude,
    required this.longitude,
  });

  factory DeviceLocation.fromJson(Map<String, dynamic> json) =>
      _$DeviceLocationFromJson(json);

  Map<String, dynamic> toJson() => _$DeviceLocationToJson(this);

  @override
  List<Object> get props => [latitude, longitude];

  @override
  bool get stringify => true;
}
