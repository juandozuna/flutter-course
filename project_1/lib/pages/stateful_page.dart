import 'package:flutter/material.dart';
import 'package:project_1/widgets/primary_button.dart';

class StatefulPage extends StatefulWidget {
  const StatefulPage({Key? key}) : super(key: key);

  @override
  State<StatefulPage> createState() => _StatefulPageState();
}

class _StatefulPageState extends State<StatefulPage> {
  // Add properties

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stateful Widget'),
      ),
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(30),
            ),
            margin: const EdgeInsets.all(20),
            height: 100,
          ),
          PrimaryButton(
            text: 'Toggle Color',
            onPressed: () {
              //TODO: Implement function
            },
          ),
          const SizedBox(height: 10),
          PrimaryButton(
            text: 'Increase Counter',
            onPressed: () {
              //TODO: Implement counter function
            },
          ),
          const SizedBox(height: 10),
          Text('SHow Counter here'),
        ],
      ),
    );
  }
}
