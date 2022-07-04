import 'package:section_5/models/resource_model.dart';

abstract class ResourcesRepository {
  Future<List<Resource>> getResources();

  Future<Resource> getResource(String id);

  Future<Resource> createResource(Resource resource);

  Future<Resource> updateResource(Resource resource);

  Future<void> deleteResource(String id);
}
