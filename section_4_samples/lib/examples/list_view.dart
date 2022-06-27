import 'package:flutter/material.dart';

class AppListView extends StatelessWidget {
  final void Function(int) onItemTap;

  const AppListView({
    Key? key,
    required this.onItemTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 15,
      itemBuilder: (context, index) {
        return _buildListItem(index);
      },
    );
  }

  Widget _buildListItem(int index) {
    return ListTile(
      title: Text('text $index'),
      onTap: () => onItemTap(index),
    );
  }
}
