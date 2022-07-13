/*
 * JUAN OZUNA Copyright (c) 2022.
 */

import 'package:json_annotation/json_annotation.dart';

part 'location_iq_model.g.dart';

@JsonSerializable(includeIfNull: false, explicitToJson: true)
class LocationIqResponse {
  LocationIqResponse({
    this.placeId,
    this.licence,
    this.osmType,
    this.osmId,
    this.lat,
    this.lon,
    this.displayName,
    required this.address,
    this.boundingbox,
  });

  final String? placeId;
  final String? licence;
  final String? osmType;
  final String? osmId;
  final String? lat;
  final String? lon;
  final String? displayName;
  final _Address address;
  final List<String>? boundingbox;

  factory LocationIqResponse.fromJson(Map<String, dynamic> json) =>
      _$LocationIqResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LocationIqResponseToJson(this);
}

@JsonSerializable(includeIfNull: false, explicitToJson: true)
class _Address {
  _Address({
    this.supermarket,
    this.road,
    this.neighbourhood,
    this.city,
    this.state,
    this.postcode,
    this.country,
    this.countryCode,
  });

  final String? supermarket;
  final String? road;
  final String? neighbourhood;
  final String? city;
  final String? state;
  final String? postcode;
  final String? country;
  final String? countryCode;

  factory _Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);

  Map<String, dynamic> toJson() => _$AddressToJson(this);
}
