import 'package:flutter/material.dart';
import 'package:project_1/widgets/primary_button.dart';

class StatefulPage extends StatefulWidget {
  const StatefulPage({Key? key}) : super(key: key);

  @override
  State<StatefulPage> createState() => _StatefulPageState();
}

class _StatefulPageState extends State<StatefulPage> {
  Color _color = Colors.red;
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stateful Widget'),
      ),
      body: Column(
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            decoration: BoxDecoration(
              color: _color,
              borderRadius: BorderRadius.circular(30),
            ),
            margin: const EdgeInsets.all(20),
            child: Container(
              height: 100,
            ),
          ),
          PrimaryButton(
            text: 'Toggle Color',
            onPressed: () {
              setState(() {
                _color = _color == Colors.red ? Colors.blue : Colors.red;
              });
            },
          ),
          const SizedBox(height: 10),
          PrimaryButton(
            text: 'Increase Counter',
            onPressed: () {
              setState(() => _counter++);
            },
          ),
          const SizedBox(height: 10),
          Text('Counter: $_counter'),
        ],
      ),
    );
  }
}
