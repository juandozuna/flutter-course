import 'package:flutter/material.dart';
import 'package:project_1_todo_list/pages/home_page.dart';
import 'package:project_1_todo_list/pages/todo_list/todo_list_page.dart';

final Map<String, Widget Function(BuildContext)> routes = {
  HomePage.routeName: (context) => const HomePage(),
  TodoListPage.routeName: (context) => const TodoListPage(),
};
