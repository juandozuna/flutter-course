import 'package:flutter/material.dart';
import 'package:project_1_todo_list/models/todo_list_model.dart';

class TodoListView extends StatelessWidget {
  final List<TodoListModel> items;
  final void Function(int) onRemoved;

  const TodoListView({
    Key? key,
    required this.items,
    required this.onRemoved,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) => _buildItem(context, index),
    );
  }

  Widget _buildItem(BuildContext context, int index) {
    final item = items[index];
    return ListTile(
      key: ObjectKey(item),
      title: Text(item.item),
      tileColor: index % 2 != 0 ? Colors.white : Colors.grey[200],
      trailing: IconButton(
        icon: const Icon(Icons.remove),
        onPressed: () => onRemoved(index),
      ),
    );
  }
}
