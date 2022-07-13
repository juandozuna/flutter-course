/*
 * JUAN OZUNA Copyright (c) 2022.
 */

import 'package:section_8/domain/models/location_model.dart';

abstract class LocationService {
  Future<DeviceLocation> getLocation();

  Future<bool> getPermissions();
}
