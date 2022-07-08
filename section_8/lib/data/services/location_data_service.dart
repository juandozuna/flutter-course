/*
 * JUAN OZUNA Copyright (c) 2022.
 */

import 'package:geolocator/geolocator.dart';
import 'package:section_8/domain/models/location_model.dart';
import 'package:section_8/domain/service/location_service.dart';

class LocationDataService implements LocationService {
  @override
  Future<DeviceLocation> getLocation() async {
    final hasPermissions = await getPermissions();
    if (!hasPermissions) {
      throw Exception('No permissions to access GPS');
    }

    final location = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    return DeviceLocation(
      latitude: location.latitude,
      longitude: location.longitude,
    );
  }

  @override
  Future<bool> getPermissions() async {
    final serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return false;
    }

    var permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return false;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return false;
    }

    return true;
  }
}
