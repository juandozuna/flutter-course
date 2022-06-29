import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:section_4_samples/examples/keyboard_state_changes.dart';
import 'package:section_4_samples/layout_page.dart';
import 'package:section_4_samples/sample_page.dart';

void main() {
  runApp(DevicePreview(
    enabled: true,
    builder: (context) => const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Main(),
    );
  }
}

class Main extends StatelessWidget {
  const Main({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: const SamplePage(),
    );
  }
}
