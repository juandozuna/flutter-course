/*
 * JUAN OZUNA Copyright (c) 2022.
 */

import 'package:section_8/domain/models/location_model.dart';
import 'package:section_8/domain/repositories/device_repository.dart';
import 'package:section_8/domain/service/location_service.dart';

class DeviceDataRepository implements DeviceRepository {
  final LocationService _locationService;

  DeviceDataRepository(this._locationService);

  @override
  Future<DeviceLocation> getDeviceLocation() {
    return _locationService.getLocation();
  }

  @override
  Future<bool> getLocationPermissions() {
    return _locationService.getPermissions();
  }
}
