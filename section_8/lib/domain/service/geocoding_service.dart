/*
 * JUAN OZUNA Copyright (c) 2022.
 */

import 'package:section_8/domain/models/location_model.dart';

abstract class GeocodingService {
  Future<GeocodedLocation> reverseLookup(DeviceLocation location);
}
