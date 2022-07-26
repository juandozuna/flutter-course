import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:section_8/domain/models/notification_model.dart';

class NotificationExamplePage extends StatefulWidget {
  const NotificationExamplePage({Key? key}) : super(key: key);

  @override
  _NotificationExamplePageState createState() =>
      _NotificationExamplePageState();
}

class _NotificationExamplePageState extends State<NotificationExamplePage> {
  @override
  Widget build(BuildContext context) {
    final data =
        ModalRoute.of(context)!.settings.arguments! as NotificationModel;

    return Scaffold(
      appBar: AppBar(
        title: Text('Notification Example'),
      ),
      body: Center(
          child: Column(
        children: [
          Text(data.title),
          if (data.body != null) Text(data.body!),
          if (data.data != null) Text(data.data.toString()),
        ],
      )),
    );
  }
}
