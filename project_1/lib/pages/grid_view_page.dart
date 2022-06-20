import 'package:flutter/material.dart';
import 'package:project_1/widgets/common_widget_container.dart';

class GridViewPage extends StatelessWidget {
  const GridViewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Grid View'),
      ),
      body: _buildGridView(),
    );
  }

  Widget _buildGridView() {
    //TODO: implement Grid View
    return Container();
  }
}
