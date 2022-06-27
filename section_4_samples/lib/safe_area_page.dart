import 'package:flutter/material.dart';

class SafeAreaPage extends StatelessWidget {
  const SafeAreaPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: _buildBody()),
    );
  }

  Widget _buildBody() {
    return Text('Safe Area Text');
  }
}
