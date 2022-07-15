import 'package:section_8/data/repositories/device_data_repository.dart';
import 'package:section_8/domain/models/location_model.dart';
import 'package:section_8/domain/repositories/device_repository.dart';

class MapProvider {
  final DeviceRepository _deviceRepository;

  MapProvider(this._deviceRepository);

  Future<DeviceLocation> getDeviceLocation() {
    return _deviceRepository.getDeviceLocation();
  }
}
