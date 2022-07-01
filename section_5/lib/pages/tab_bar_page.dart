import 'package:flutter/material.dart';

class TabBarPage extends StatefulWidget {
  const TabBarPage({Key? key}) : super(key: key);

  @override
  State<TabBarPage> createState() => _TabBarPageState();
}

class _TabBarPageState extends State<TabBarPage> with TickerProviderStateMixin {
  // create a tab controller
  late final TabController _tabController;
  String text = 'Tab 1';

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
    final tabs = [
      Tab(
        text: 'Home',
      ),
      Tab(
        text: 'Resources',
      ),
      Tab(
        text: 'Account',
      ),
    ];
    final tabBar = TabBar(
      indicatorColor: Colors.black,
      indicatorWeight: 3,
      controller: _tabController,
      tabs: tabs,
      onTap: (int index) {
        final title = tabs[index].text;
        setState(() => text = title ?? '');
      },
    );
    return Scaffold(
      appBar: AppBar(
        title: Text(text),
        bottom: tabBar,
      ),
      body: TabBarView(
        physics: NeverScrollableScrollPhysics(),
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
        color: Colors.amber,
        child: tabBar,
      ),
    );
  }
}
