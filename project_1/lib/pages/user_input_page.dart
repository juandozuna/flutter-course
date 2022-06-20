import 'package:flutter/material.dart';
import 'package:project_1/widgets/common_widget_container.dart';
import 'package:project_1/widgets/primary_button.dart';

class UserInputPage extends StatefulWidget {
  const UserInputPage({Key? key}) : super(key: key);

  @override
  State<UserInputPage> createState() => _UserInputPageState();
}

class _UserInputPageState extends State<UserInputPage> {
  final _nameController = TextEditingController();
  String labelName = '';
  String? nameError;
  String description = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Input'),
      ),
      body: Column(
        children: [
          TextField(
            decoration: InputDecoration(
              labelText: 'Name',
              errorText: nameError,
            ),
            controller: _nameController,
          ),
          const SizedBox(height: 10),
          if (labelName.isNotEmpty)
            CommonWidgetContainer(child: Text(labelName)),
          const SizedBox(height: 10),
          PrimaryButton(
            text: 'Update Name',
            onPressed: _updateName,
          ),
          TextField(
            decoration: const InputDecoration(
              labelText: 'Description',
            ),
            onChanged: (val) => _updateDescription(val),
          ),
          const SizedBox(height: 10),
          if (description.isNotEmpty)
            CommonWidgetContainer(child: Text(description)),
        ],
      ),
    );
  }

  void _updateName() {
    final text = _nameController.text;

    if (text.length < 4) {
      setState(() {
        nameError = 'Name must be at least 4 characters';
        labelName = '';
      });
      return;
    }

    setState(() {
      if (text.isEmpty) {
        labelName = '';
      } else {
        labelName = 'Hello, $text';
      }
    });
  }

  void _updateDescription(String value) {
    setState(() {
      description = value;
    });
  }
}
