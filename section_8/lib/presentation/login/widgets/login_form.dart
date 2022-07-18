import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:provider/provider.dart';
import 'package:section_8/injector.dart';
import 'package:section_8/presentation/constants/routes.dart';
import 'package:section_8/presentation/providers/auth_provider.dart';
import 'package:section_8/presentation/widgets/app_text_field.dart';
import 'package:section_8/presentation/widgets/centered_circular_loading.dart';
import 'package:section_8/presentation/widgets/error_container.dart';
import 'package:section_8/presentation/widgets/primary_button.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';

  FocusNode _passwordFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(builder: (context, val, child) {
      if (val.isLoading) {
        return const CenteredCircularLoading();
      }
      return Container(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              if (val.hasError) ErrorContainer(error: val.error.toString()),
              AppTextField(
                key: ValueKey('email-field'),
                labelKey: 'email',
                nextFocusNode: _passwordFocusNode,
                keyboardType: TextInputType.emailAddress,
                validators: [
                  RequiredValidator(errorText: 'Email is required'),
                  EmailValidator(errorText: 'Email is invalid'),
                ],
                initialValue: email,
                onSaved: (val) => email = val ?? '',
              ),
              AppTextField(
                key: ValueKey('password-field'),
                labelKey: 'password',
                focusNode: _passwordFocusNode,
                obscureText: true,
                validators: [
                  RequiredValidator(errorText: 'Password is required'),
                ],
                onSaved: (val) => password = val ?? '',
              ),
              SizedBox(height: 20),
              PrimaryButton(labelKey: 'logIn', onPressed: submitForm),
            ],
          ),
        ),
      );
    });
  }

  void submitForm() async {
    final form = _formKey.currentState!;

    final isValid = form.validate();

    if (!isValid) {
      return;
    }

    form.save();

    final authProvider = Provider.of<AuthProvider>(context, listen: false);

    final isSuccess =
        await authProvider.signInWithEmailAndPassword(email, password);

    if (isSuccess) {
      Navigator.of(context).pushReplacementNamed(AppRoute.home);
    }
  }
}
