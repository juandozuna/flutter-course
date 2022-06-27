import 'package:flutter/material.dart';
import 'package:section_4_samples/examples/keyboard_state_changes.dart';

class SamplePage extends StatelessWidget {
  const SamplePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Title'),
        ),
        body: const KeyboardStateChanges());
  }
}
