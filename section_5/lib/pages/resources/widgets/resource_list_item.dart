import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
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
    final color = HexColor(resource.color);
    return Slidable(
      endActionPane: ActionPane(
        children: [
          SlidableAction(
            icon: Icons.edit,
            onPressed: null,
            label: 'Edit',
            backgroundColor: Theme.of(context).errorColor,
          ),
          SlidableAction(
            icon: Icons.delete,
            onPressed: null,
            label: 'Delete',
            backgroundColor: Theme.of(context).primaryColor,
          )
        ],
        motion: const ScrollMotion(),
      ),
      child: ListTile(
        tileColor: color.withAlpha(60),
        leading: colorIndicator(color),
        title: Text(resource.name),
      ),
    );
  }

  Widget colorIndicator(Color color) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
    );
  }
}
