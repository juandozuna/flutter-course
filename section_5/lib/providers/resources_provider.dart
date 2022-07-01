import 'package:section_5/models/resource_model.dart';
import 'package:section_5/providers/base_notifier_provider.dart';
import 'package:section_5/repositories/resources_repository.dart';

class ResourcesProvider extends BaseNotifierProvider {
  final ResourcesRepository _resourcesRepository;

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
    final resources = await _resourcesRepository.getResources();
    _setResources(resources);
  }
}
