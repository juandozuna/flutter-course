import 'package:flutter/material.dart';
import 'package:project_1/pages/common_widget_page.dart';
import 'package:project_1/pages/grid_view_page.dart';
import 'package:project_1/pages/stateful_page.dart';
import 'package:project_1/pages/user_input_page.dart';

class _ListItem {
  final String title;
  final Widget page;

  _ListItem(this.title, this.page);
}

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // This are the items to be shown
    final items = <_ListItem>[
      _ListItem('Stateful Widget', const StatefulPage()),
      _ListItem('Common Widgets', const CommonWidgetPage()),
      _ListItem('GridView', const GridViewPage()),
      _ListItem('User Input', const UserInputPage()),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Main Page'),
      ),
      body: ListView(
        children: items.asMap().entries.map((entry) {
          final item = entry.value;
          final index = entry.key;
          return ListTile(
            title: Text(item.title),
            tileColor: index % 2 == 0 ? Colors.white : Colors.grey[200],
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => item.page,
                ),
              );
            },
          );
        }).toList(),
      ),
    );
  }
}
