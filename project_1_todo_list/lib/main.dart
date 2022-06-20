import 'package:flutter/material.dart';
import 'package:project_1_todo_list/pages/home_page.dart';
import 'package:project_1_todo_list/routes.dart';

void main() {
  runApp(const TodoListApp());
}

class TodoListApp extends StatelessWidget {
  const TodoListApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.cyan,
        ),
        routes: routes,
        initialRoute: HomePage.routeName,
      ),
    );
  }
}
