import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:project_1_todo_list/widgets/circular_icon_button.dart';
import 'package:project_1_todo_list/widgets/text_form_field.dart';

class TodoListForm extends StatefulWidget {
  final void Function(String) onSubmit;

  const TodoListForm({
    Key? key,
    required this.onSubmit,
  }) : super(key: key);

  @override
  State<TodoListForm> createState() => _TodoListFormState();
}

class _TodoListFormState extends State<TodoListForm> {
  final _controller = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String? _item;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
    );
  }
}
