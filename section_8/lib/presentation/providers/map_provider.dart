import 'dart:io';
import 'dart:typed_data';

import 'package:section_8/data/repositories/device_data_repository.dart';
import 'package:section_8/domain/models/location_model.dart';
import 'package:section_8/domain/repositories/device_repository.dart';
import 'package:section_8/domain/repositories/file_repository.dart';

class MapProvider {
  final DeviceRepository _deviceRepository;
  final FileRepository _fileRepository;

  DeviceLocation? _selectedLocation;

  bool get hasLocation => _selectedLocation != null;

  MapProvider(
    this._deviceRepository,
    this._fileRepository,
  );

  Future<DeviceLocation> getDeviceLocation() {
    return _deviceRepository.getDeviceLocation();
  }

  Future<String> saveMapImage(Uint8List file) {
    return _fileRepository.saveFileFromBytes(file);
  }

  void setSelectedLocation(DeviceLocation location) {
    _selectedLocation = location;
  }

  void clearSelectedLocation() {
    _selectedLocation = null;
  }

  DeviceLocation? getSelectedLocation() {
    return _selectedLocation;
  }
}
