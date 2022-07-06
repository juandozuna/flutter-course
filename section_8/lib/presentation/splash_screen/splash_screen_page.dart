import 'package:flutter/material.dart';
import 'package:section_8/presentation/widgets/centered_circular_loading.dart';

class SplashScreenPage extends StatelessWidget {
  const SplashScreenPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CenteredCircularLoading(),
    );
  }
}
