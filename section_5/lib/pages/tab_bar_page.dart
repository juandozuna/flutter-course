import 'package:flutter/material.dart';
import 'package:section_5/widgets/CustomAppBar.dart';

class TabBarPage extends StatefulWidget {
  const TabBarPage({Key? key}) : super(key: key);

  @override
  State<TabBarPage> createState() => _TabBarPageState();
}

class _TabBarPageState extends State<TabBarPage> with TickerProviderStateMixin {
  // create a tab controller
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 3,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    final tabBar = TabBar(
      controller: _tabController,
      tabs: const <Tab>[
        Tab(
          text: 'Home',
        ),
        Tab(
          text: 'Resources',
        ),
        Tab(
          text: 'Account',
        ),
      ],
      onTap: (int index) {
        print('index: $index');
      },
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tab Bar'),
        bottom: tabBar,
      ),
      body: TabBarView(
        controller: _tabController,
        children: const <Widget>[
          Center(
            child: Text('Home'),
          ),
          Center(
            child: Text('Resources'),
          ),
          Center(
            child: Text('Account'),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        child: tabBar,
      ),
    );
  }
}
