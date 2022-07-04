import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:section_5/providers/initialize_provider.dart';

class InitialPage extends StatefulWidget {
  static const String routeName = '/';
  const InitialPage({Key? key}) : super(key: key);

  @override
  State<InitialPage> createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, init);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Initial Page'),
      ),
    );
  }

  void init() {
    Provider.of<InitializeProvider>(context, listen: false).initialize();
  }
}
