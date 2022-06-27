import 'package:flutter/material.dart';
import 'package:section_4_samples/examples/side_view.dart';

class SideViewPage extends StatefulWidget {
  const SideViewPage({Key? key}) : super(key: key);

  @override
  _SideViewPageState createState() => _SideViewPageState();
}

class _SideViewPageState extends State<SideViewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SideView Page'),
      ),
      body: const SideView(),
    );
  }
}
