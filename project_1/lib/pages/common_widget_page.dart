import 'package:flutter/material.dart';
import 'package:project_1/widgets/common_widget_container.dart';

class CommonWidgetPage extends StatelessWidget {
  const CommonWidgetPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Widget> children = <Widget>[
      //TODO: Add widgets to this list
      const Text('This is a text widget'),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Common Widget'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: children
              .map(
                (e) => CommonWidgetContainer(
                  child: e,
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
