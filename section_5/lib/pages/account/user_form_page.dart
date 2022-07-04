import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:section_5/injector.dart';
import 'package:section_5/models/users/create_user_model.dart';
import 'package:section_5/providers/users_provider.dart';
import 'package:section_5/theme/theme.dart';
import 'package:section_5/widgets/app_text_field.dart';

class UserFormPage extends StatefulWidget {
  static const String routeName = '/user-form';

  const UserFormPage({Key? key}) : super(key: key);

  @override
  State<UserFormPage> createState() => _UserFormPageState();
}

class _UserFormPageState extends State<UserFormPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String? _name;
  String? _job;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Form'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          buildForm(),
          buildButton(),
        ],
      ),
    );
  }

  Widget buildButton() {
    return Padding(
      padding: const EdgeInsets.all(
        AppValues.horizontalMargin,
      ),
      child: ElevatedButton(
        onPressed: () {
          onSubmit();
        },
        child: Container(
          padding: EdgeInsets.all(AppValues.horizontalMargin),
          width: double.infinity,
          child: Text('Submit'),
        ),
      ),
    );
  }

  Widget buildForm() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          AppTextField(
            label: 'Name',
            keyboardType: TextInputType.name,
            validators: [
              RequiredValidator(errorText: 'Name is required'),
              MinLengthValidator(3,
                  errorText: 'Name must be at least 3 characters'),
            ],
            onSaved: (value) => _name = value,
          ),
          AppTextField(
            label: 'Job',
            validators: [
              RequiredValidator(errorText: 'Job is required'),
              MinLengthValidator(3,
                  errorText: 'Job must be at least 3 characters'),
            ],
            onSaved: (value) => _job = value,
          ),
        ],
      ),
    );
  }

  void onSubmit() async {
    final form = _formKey.currentState!;

    final isValid = form.validate();

    if (!isValid) {
      return;
    }

    form.save();

    final request = CreateUserRequest(name: _name!, job: _job!);

    final provider = get<UserProvider>();

    await provider.createUser(request);

    Navigator.pop(context);
  }
}
