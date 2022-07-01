import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:section_5/injector.dart';
import 'package:section_5/pages/resources/widgets/resource_list_item.dart';
import 'package:section_5/providers/resources_provider.dart';

class ResourcesListView extends StatefulWidget {
  const ResourcesListView({Key? key}) : super(key: key);

  @override
  State<ResourcesListView> createState() => _ResourcesListViewState();
}

class _ResourcesListViewState extends State<ResourcesListView> {
  @override
  void initState() {
    super.initState();
    _getData();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ResourcesProvider>(
      builder: (context, provider, child) {
        return ListView.builder(
          itemCount: provider.resources.length,
          itemBuilder: (_, index) {
            final resource = provider.resources[index];
            return ResourceListItem(resource);
          },
        );
      },
    );
  }

  void _getData() {
    final resourcesProvider = get<ResourcesProvider>();
    resourcesProvider.getResources();
  }
}
