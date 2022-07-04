import 'package:flutter/material.dart';
import 'package:section_5/injector.dart';
import 'package:section_5/providers/users_provider.dart';
import 'package:section_5/widgets/primary_button.dart';

class SecondPage extends StatelessWidget {
  static const String routeName = '/second';
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Page'),
      ),
      body: Center(
          child: PrimaryButton(
        label: 'Log Out',
        onPressed: signOut,
      )),
    );
  }

  void signOut() {
    final userProvider = get<UserProvider>();
    userProvider.signOut();
  }
}
