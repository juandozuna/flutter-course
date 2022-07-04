import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:provider/provider.dart';
import 'package:section_5/injector.dart';
import 'package:section_5/models/users/login_user_mode.dart';
import 'package:section_5/pages/navigation_page.dart';
import 'package:section_5/providers/users_provider.dart';
import 'package:section_5/theme/theme.dart';
import 'package:section_5/widgets/app_text_field.dart';
import 'package:section_5/widgets/center_circular_loading.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();

  String? _email;
  String? _password;

  FocusNode _passwordFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Consumer<UserProvider>(builder: (context, value, child) {
      if (value.isLoading) {
        return CenterCircularLoading();
      }
      return Container(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              if (value.hasError)
                Container(
                  margin: EdgeInsets.all(AppValues.horizontalMargin),
                  padding: EdgeInsets.all(AppValues.horizontalMargin),
                  color: AppColor.danger,
                  child: Text(value.error.toString()),
                ),
              AppTextField(
                label: 'Email',
                keyboardType: TextInputType.emailAddress,
                nextFocusNode: _passwordFocusNode,
                validators: [
                  RequiredValidator(errorText: 'Email is required'),
                  EmailValidator(errorText: 'Email is invalid'),
                ],
                onSaved: (val) => _email = val,
                initialValue: _email,
              ),
              AppTextField(
                label: 'Password',
                obscureText: true,
                focusNode: _passwordFocusNode,
                validators: [
                  RequiredValidator(errorText: 'Password is required'),
                  MinLengthValidator(
                    6,
                    errorText: 'Password must be at least 6 characters',
                  ),
                ],
                onSaved: (val) => _password = val,
                textInputAction: TextInputAction.done,
                onFieldSubmitted: (val) => submitForm(),
              ),
              SizedBox(
                height: AppValues.verticalMargin,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppValues.horizontalMargin,
                ),
                child: ElevatedButton(
                  onPressed: submitForm,
                  child: Container(
                    width: double.infinity,
                    child: Text('Login'),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }

  void submitForm() async {
    FocusScope.of(context).requestFocus(FocusNode());

    final form = _formKey.currentState!;
    final isValid = form.validate();

    if (!isValid) {
      return;
    }

    form.save();

    final request = LoginUserModel(
      email: _email!,
      password: _password!,
    );

    final provider = get<UserProvider>();
    final success = await provider.login(request);

    if (success) {
      Navigator.of(context).pushReplacementNamed(NavigationPage.routeName);
    }
  }
}
