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
    final gridView = GridView.count(
      crossAxisCount: 2,
      children: List.generate(100, (index) {
        return CommonWidgetContainer(
          child: Text('Item $index'),
        );
      }),
    );

    return gridView;
  }
}
