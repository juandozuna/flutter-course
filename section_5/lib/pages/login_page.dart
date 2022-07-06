import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:provider/provider.dart';
import 'package:section_5/injector.dart';
import 'package:section_5/models/users/login_model.dart';
import 'package:section_5/pages/navigation_page.dart';
import 'package:section_5/providers/users_provider.dart';
import 'package:section_5/theme/theme.dart';
import 'package:section_5/widgets/app_text_field.dart';
import 'package:section_5/widgets/center_circular_loading.dart';
import 'package:section_5/widgets/primary_button.dart';

class LoginPage extends StatefulWidget {
  static const String routeName = '/login';

  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _passwordIsObscure = true;

  FocusNode _passwordNode = FocusNode();

  String? _email;
  String? _password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<UserProvider>(builder: (context, value, child) {
        if (value.isLoading) {
          return CenterCircularLoading();
        }
        return Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (value.hasError)
                Container(
                  color: AppColor.danger,
                  padding: EdgeInsets.all(AppValues.horizontalMargin),
                  margin: EdgeInsets.all(AppValues.horizontalMargin),
                  child: Text(
                    value.error.toString(),
                  ),
                ),
              Container(
                width: double.infinity,
                child: Text(
                  'Login Form',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline4,
                ),
              ),
              AppTextField(
                label: 'Email',
                onSaved: (val) => _email = val,
                nextFocusNode: _passwordNode,
                validators: [
                  RequiredValidator(errorText: 'Email is required'),
                  EmailValidator(errorText: 'This is not a valid email'),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: AppTextField(
                      label: 'Password',
                      focusNode: _passwordNode,
                      onSaved: (val) => _password = val,
                      validators: [
                        RequiredValidator(errorText: 'Password is required'),
                      ],
                      obscureText: _passwordIsObscure,
                      onFieldSubmitted: (_) => onSubmit(),
                      textInputAction: TextInputAction.done,
                    ),
                  ),
                  IconButton(
                    onPressed: () => setState(
                        () => _passwordIsObscure = !_passwordIsObscure),
                    icon: Icon(
                      _passwordIsObscure
                          ? Icons.remove_red_eye
                          : Icons.remove_red_eye_outlined,
                    ),
                  ),
                ],
              ),
              PrimaryButton(
                label: 'Login',
                onPressed: onSubmit,
              ),
            ],
          ),
        );
      }),
    );
  }

  void onSubmit() async {
    final form = _formKey.currentState!;

    final isValid = form.validate();

    if (!isValid) {
      return;
    }

    form.save();

    final request = LoginUserRequest(email: _email!, password: _password!);

    final userProvider = get<UserProvider>();

    final isSuccess = await userProvider.login(request);

    if (isSuccess) {
      Navigator.of(context).pushReplacementNamed(NavigationPage.routeName);
    }
  }
}
