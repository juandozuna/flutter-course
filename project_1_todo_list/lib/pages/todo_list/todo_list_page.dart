import 'package:flutter/material.dart';
import 'package:project_1_todo_list/models/todo_list_model.dart';
import 'package:project_1_todo_list/pages/todo_list/todo_list_form.dart';
import 'package:project_1_todo_list/pages/todo_list/todo_list_view.dart';
import 'package:project_1_todo_list/widgets/primary_button.dart';

class TodoListPage extends StatefulWidget {
  static const String routeName = '/todo-list';
  const TodoListPage({Key? key}) : super(key: key);

  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  final List<TodoListModel> items = [];

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
    return SafeArea(
      child: Column(
        children: <Widget>[
          _buildForm(),
          _buildList(),
        ],
      ),
    );
  }

  Widget _buildForm() => TodoListForm();

  Widget _buildList() => Expanded(
        child: TodoListView(),
      );

  void onAddedItem(String item) {
    // Crear un nuevo item y agregarlo a la lista
  }

  void onRemove(int index) async {
    final result = await showDialog(
      context: context,
      builder: (ctx) => _buildBottomSheet(ctx),
    );

    // Si el usuario confirma que quiere eliminar remover del UI el item
  }

  Widget _buildBottomSheet(BuildContext ctx) {
    // Mostrar alerta de confirmacion para eliminar
  }
}
