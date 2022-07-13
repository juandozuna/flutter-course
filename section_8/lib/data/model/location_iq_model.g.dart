// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_iq_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LocationIqResponse _$LocationIqResponseFromJson(Map<String, dynamic> json) =>
    LocationIqResponse(
      placeId: json['placeId'] as String?,
      licence: json['licence'] as String?,
      osmType: json['osmType'] as String?,
      osmId: json['osmId'] as String?,
      lat: json['lat'] as String?,
      lon: json['lon'] as String?,
      displayName: json['displayName'] as String?,
      address: _Address.fromJson(json['address'] as Map<String, dynamic>),
      boundingbox: (json['boundingbox'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$LocationIqResponseToJson(LocationIqResponse instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('placeId', instance.placeId);
  writeNotNull('licence', instance.licence);
  writeNotNull('osmType', instance.osmType);
  writeNotNull('osmId', instance.osmId);
  writeNotNull('lat', instance.lat);
  writeNotNull('lon', instance.lon);
  writeNotNull('displayName', instance.displayName);
  val['address'] = instance.address.toJson();
  writeNotNull('boundingbox', instance.boundingbox);
  return val;
}

_Address _$AddressFromJson(Map<String, dynamic> json) => _Address(
      supermarket: json['supermarket'] as String?,
      road: json['road'] as String?,
      neighbourhood: json['neighbourhood'] as String?,
      city: json['city'] as String?,
      state: json['state'] as String?,
      postcode: json['postcode'] as String?,
      country: json['country'] as String?,
      countryCode: json['countryCode'] as String?,
    );

Map<String, dynamic> _$AddressToJson(_Address instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('supermarket', instance.supermarket);
  writeNotNull('road', instance.road);
  writeNotNull('neighbourhood', instance.neighbourhood);
  writeNotNull('city', instance.city);
  writeNotNull('state', instance.state);
  writeNotNull('postcode', instance.postcode);
  writeNotNull('country', instance.country);
  writeNotNull('countryCode', instance.countryCode);
  return val;
}
