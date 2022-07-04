import 'package:flutter/material.dart';
import 'package:section_5/pages/login/login_form.dart';

class LoginPage extends StatelessWidget {
  static const String routeName = '/login';

  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          title(context),
          LoginForm(),
        ],
      ),
    );
  }

  Widget title(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Text(
        'Login Page',
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.headline5,
      ),
    );
  }
}
