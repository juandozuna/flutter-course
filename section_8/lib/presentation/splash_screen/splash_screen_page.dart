import 'package:flutter/material.dart';
import 'package:section_8/injector.dart';
import 'package:section_8/presentation/providers/init_provider.dart';
import 'package:section_8/presentation/widgets/centered_circular_loading.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({Key? key}) : super(key: key);

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () => init());
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CenteredCircularLoading(),
    );
  }

  void init() {
    final initProvider = get<InitProvider>();
    initProvider.init();
  }
}
