import 'package:flutter/material.dart';
import 'package:section_5/core/color.dart';
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
      leading: colorIndicator(),
      title: Text(resource.name),
    );
  }

  Widget colorIndicator() {
    return Container(
      width: 10,
      height: 10,
      decoration: BoxDecoration(
        color: HexColor(resource.color),
        shape: BoxShape.circle,
      ),
    );
  }
}
