import 'package:flutter/material.dart';

class EndPage extends StatelessWidget {
  static const String routeName = '/end';

  const EndPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: SafeArea(child: Center(child: Text('End Page'))));
  }
}
