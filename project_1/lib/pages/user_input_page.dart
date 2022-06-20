import 'package:flutter/material.dart';
import 'package:project_1/widgets/common_widget_container.dart';
import 'package:project_1/widgets/primary_button.dart';

class UserInputPage extends StatefulWidget {
  const UserInputPage({Key? key}) : super(key: key);

  @override
  State<UserInputPage> createState() => _UserInputPageState();
}

class _UserInputPageState extends State<UserInputPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  String labelName = '';
  String? nameError;
  String description = '';
  String? formVal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Input'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(
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
            Form(
              key: _formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Email',
                    ),
                    keyboardType: TextInputType.emailAddress,
                    onSaved: (val) => formVal = val,
                    validator: (val) {
                      if (val == null || val.isEmpty) {
                        return 'This is a required field';
                      }
                      // Validate email with regex
                      final RegExp emailRegex = RegExp(
                        r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$',
                      );
                      if (!emailRegex.hasMatch(val)) {
                        return 'Invalid email';
                      }
                      return null;
                    },
                  ),
                  PrimaryButton(text: 'Submit', onPressed: submitForm),
                  if (formVal != null) Text(formVal!)
                ],
              ),
            ),
          ],
        ),
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

  void submitForm() {
    final formState = _formKey.currentState!;
    final isFormValid = formState.validate();
    if (!isFormValid) {
      return;
    }

    formState.save();

    setState(() {});
  }
}
