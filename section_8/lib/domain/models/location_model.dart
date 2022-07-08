/*
 * JUAN OZUNA Copyright (c) 2022.
 */

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'location_model.g.dart';

@JsonSerializable()
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
