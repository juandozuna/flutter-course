import 'package:section_5/models/resource_model.dart';
import 'package:section_5/providers/base_notifier_provider.dart';
import 'package:section_5/repositories/resources_repository.dart';

class ResourcesProvider extends BaseNotifierProvider {
  final ResourcesRepository _resourcesRepository;

  bool isInitialLoad = true;
  List<Resource> _loadedResources = [];

  List<Resource> get resources => _loadedResources;

  ResourcesProvider(
    this._resourcesRepository,
  );

  void _setResources(List<Resource> resources) {
    _loadedResources = resources;
    notifyListeners();
  }

  Future<void> getResources() async {
    if (isInitialLoad) {
      isInitialLoad = false;
      await _getResourcesRequest();
    }
  }

  Future<void> _getResourcesRequest() async {
    startLoading();
    try {
      final resources = await _resourcesRepository.getResources();
      _setResources(resources);
    } catch (e) {
      setError(e);
    } finally {
      stopLoading();
    }
  }

  void addResource(Resource resource) async {
    startLoading();
    try {
      await _resourcesRepository.createResource(resource);
      final resources = await _resourcesRepository.getResources();
      _setResources(resources);
    } catch (e) {
      setError(e);
    } finally {
      stopLoading();
    }
  }

  void updateResource(Resource resource) async {
    startLoading();
    try {
      await _resourcesRepository.updateResource(resource);
      final resources = await _resourcesRepository.getResources();
      _setResources(resources);
    } catch (e) {
      setError(e);
    } finally {
      stopLoading();
    }
  }
}
