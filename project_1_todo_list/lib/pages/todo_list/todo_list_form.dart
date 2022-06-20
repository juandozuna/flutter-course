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
      child: Row(
        children: [
          Expanded(
            child: TLTextFormField(
              label: 'Item',
              onSaved: (val) => _item = val,
              controller: _controller,
              validator: MultiValidator([
                RequiredValidator(errorText: 'This is a required field'),
                MinLengthValidator(5, errorText: 'Minimum 5 characters'),
              ]),
            ),
          ),
          CircularIconButton(icon: Icons.add, onPressed: submitItem),
          const SizedBox(width: 10),
        ],
      ),
    );
  }

  void submitItem() {
    final formState = _formKey.currentState!;
    final isValid = formState.validate();

    if (isValid) {
      formState.save();
      widget.onSubmit(_item!);
      clearForm();
    }
  }

  void clearForm() {
    FocusScope.of(context).requestFocus(FocusNode());
    setState(() => _controller.clear());
  }
}
