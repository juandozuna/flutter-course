import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:section_5/injector.dart';
import 'package:section_5/pages/resources/resources_form_page.dart';
import 'package:section_5/pages/resources/widgets/resource_list_item.dart';
import 'package:section_5/providers/resources_provider.dart';
import 'package:section_5/theme/theme.dart';
import 'package:section_5/widgets/center_circular_loading.dart';

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
        if (provider.isLoading) {
          return CenterCircularLoading();
        }
        return ListView.builder(
          itemCount: provider.resources.length + 1,
          itemBuilder: (_, index) {
            if (index == provider.resources.length) {
              return _buildAddButton();
            }
            final resource = provider.resources[index];
            return ResourceListItem(resource);
          },
        );
      },
    );
  }

  Widget _buildAddButton() {
    return ListTile(
      onTap: () {
        Navigator.pushNamed(
          context,
          ResourcesFormPage.routeName,
        );
      },
      tileColor: AppColor.black,
      leading: Icon(
        Icons.add,
        color: AppColor.white,
      ),
      title: Text(
        'Add Resource',
        style: TextStyle(
          color: AppColor.white,
          fontSize: 20,
        ),
      ),
    );
  }

  void _getData() {
    final resourcesProvider = get<ResourcesProvider>();
    resourcesProvider.getResources();
  }
}
