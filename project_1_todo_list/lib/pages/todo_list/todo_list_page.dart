import 'package:flutter/material.dart';

class TodoListPage extends StatefulWidget {
  static const String routeName = '/todo-list';
  const TodoListPage({Key? key}) : super(key: key);

  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo List'),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return const Center(child: Text('Todo List'));
  }
}
