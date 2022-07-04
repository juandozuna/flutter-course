import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:section_5/providers/initialize_provider.dart';
import 'package:section_5/widgets/center_circular_loading.dart';

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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Splash Screen'),
          CenterCircularLoading(),
        ],
      ),
    );
  }

  void init() {
    Provider.of<InitializeProvider>(context, listen: false).initialize();
  }
}
