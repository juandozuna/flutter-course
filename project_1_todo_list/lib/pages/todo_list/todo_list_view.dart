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
    return Container();
  }
}
