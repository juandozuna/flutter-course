import 'package:flutter/material.dart';
import 'package:section_8/presentation/login/widgets/login_form.dart';
import 'package:section_8/presentation/widgets/logo.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Logo(),
        const SizedBox(height: 10),
        LoginForm(),
      ],
    );
  }
}
