import 'package:flutter/material.dart';
import 'package:section_5/widgets/CustomAppBar.dart';

class NavigationPage extends StatelessWidget {
  const NavigationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Main Nav',
      ),
    );
  }
}
