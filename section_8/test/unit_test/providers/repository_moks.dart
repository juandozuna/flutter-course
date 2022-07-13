import 'package:mockito/annotations.dart';
import 'package:section_8/domain/repositories/auth_repository.dart';
import 'package:section_8/domain/repositories/device_repository.dart';

@GenerateMocks([
  AuthRepository,
  DeviceRepository,
])
void main() {}
