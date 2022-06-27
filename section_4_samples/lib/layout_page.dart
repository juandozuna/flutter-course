import 'package:flutter/material.dart';
import 'package:section_4_samples/examples/list_view.dart';

class LayoutPage extends StatelessWidget {
  const LayoutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Layout Page'),
        ),
        body: _buildBody());
  }

  Widget _buildBody() {
    return AppListView(onItemTap: (i) {});
  }
}
