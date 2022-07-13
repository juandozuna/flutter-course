/*
 * JUAN OZUNA Copyright (c) 2022.
 */

import 'package:dio/dio.dart';
import 'package:section_8/constant.dart';
import 'package:section_8/data/model/location_iq_model.dart';
import 'package:section_8/domain/models/location_model.dart';
import 'package:section_8/domain/service/geocoding_service.dart';

class GeocodingDataService implements GeocodingService {
  @override
  Future<GeocodedLocation> reverseLookup(DeviceLocation location) async {
    final locationIqResponse = await _getData(location);
    
    return GeocodedLocation(
      displayName: locationIqResponse.displayName ?? '',
      neighbourhood: locationIqResponse.address.neighbourhood ?? '',
      country: locationIqResponse.address.country ?? '',
      city: locationIqResponse.address.city ?? '',
    );
  }

  Future<LocationIqResponse> _getData(DeviceLocation location) async {
    final client = Dio();
    final url = 'https://us1.locationiq.com/v1/reverse';
    final response = await client.get(url, queryParameters: {
      'key': locatorAPIKey,
      'lat': location.latitude,
      'lon': location.longitude,
      'format': 'json',
    });
    final data = response.data as Map<String, dynamic>;
    final converted = LocationIqResponse.fromJson(data);
    return converted;
  }
}
