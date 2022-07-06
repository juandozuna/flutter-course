import 'package:flutter/material.dart';
import 'package:section_5/injector.dart';
import 'package:section_5/providers/init_provider.dart';
import 'package:section_5/widgets/center_circular_loading.dart';

class SplashScreenPage extends StatefulWidget {
  static const String routeName = '/';

  const SplashScreenPage({Key? key}) : super(key: key);

  @override
  _SplashScreenPageState createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () => runInit());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CenterCircularLoading(),
    );
  }

  void runInit() {
    final initProvider = get<InitProvider>();
    initProvider.initialize();
  }
}
