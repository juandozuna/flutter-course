import 'package:flutter/material.dart';
import 'package:project_1/widgets/common_widget_container.dart';
import 'package:project_1/widgets/primary_button.dart';

class UserInputPage extends StatefulWidget {
  const UserInputPage({Key? key}) : super(key: key);

  @override
  State<UserInputPage> createState() => _UserInputPageState();
}

class _UserInputPageState extends State<UserInputPage> {
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
                  ),
                ),
                const SizedBox(height: 10),
                // Show the user input
                const SizedBox(height: 10),
                PrimaryButton(
                  text: 'Update Name',
                ),
                TextField(
                  decoration: const InputDecoration(
                    labelText: 'Description',
                  ),
                ),
                const SizedBox(height: 10),
                // Show next input with two way binding
              ],
            ),
            Form(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Email',
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  PrimaryButton(text: 'Submit', onPressed: submitForm),
                  // Show form field results
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _updateName() {
    //TODO: Implement and use function
  }

  void _updateDescription(String value) {
    //TODO: implement and use function
  }

  void submitForm() {
    //TODO: implement and use function
  }
}
