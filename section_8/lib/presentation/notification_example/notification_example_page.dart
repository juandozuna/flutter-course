import 'package:flutter/material.dart';

class NotificationExamplePage extends StatefulWidget {
  const NotificationExamplePage({Key? key}) : super(key: key);

  @override
  _NotificationExamplePageState createState() =>
      _NotificationExamplePageState();
}

class _NotificationExamplePageState extends State<NotificationExamplePage> {
  @override
  Widget build(BuildContext context) {
    final data = ModalRoute.of(context)!.settings.arguments!;
    return Scaffold(
      appBar: AppBar(
        title: Text('Notification Example'),
      ),
      body: Center(
        child: Text('$data'),
      ),
    );
  }
}
