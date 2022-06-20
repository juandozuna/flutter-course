import 'package:flutter/material.dart';
import 'package:project_1_todo_list/pages/todo_list/todo_list_page.dart';
import 'package:project_1_todo_list/widgets/primary_button.dart';

class HomePage extends StatelessWidget {
  static const String routeName = '/';

  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: PrimaryButton(
          label: 'Comenzar!',
          onPressed: () => goToList(context),
        ),
      ),
    );
  }

  void goToList(BuildContext context) {
    Navigator.of(context).pushNamed(TodoListPage.routeName);
  }
}
