import 'package:flutter/material.dart';
import 'package:section_5/models/resource_model.dart';

class ResourceListItem extends StatelessWidget {
  final Resource resource;

  const ResourceListItem(
    this.resource, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(resource.name),
    );
  }
}
