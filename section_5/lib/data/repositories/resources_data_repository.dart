import 'package:section_5/data/services/resource_service.dart';
import 'package:section_5/models/resource_model.dart';
import 'package:section_5/repositories/resources_repository.dart';

class ResourcesDataRepository implements ResourcesRepository {
  final ResourceService _resourceService;

  ResourcesDataRepository(this._resourceService);

  @override
  Future<Resource> createResource(Resource resource) async {
    await _resourceService.createResource(resource);
    return resource;
  }

  @override
  Future<void> deleteResource(String id) {
    // TODO: implement deleteResource
    throw UnimplementedError();
  }

  @override
  Future<Resource> getResource(String id) {
    // TODO: implement getResource
    throw UnimplementedError();
  }

  @override
  Future<List<Resource>> getResources() async {
    final data = await _resourceService.getResources();
    return data.data;
  }

  @override
  Future<Resource> updateResource(Resource resource) {
    // TODO: implement updateResource
    throw UnimplementedError();
  }
}
