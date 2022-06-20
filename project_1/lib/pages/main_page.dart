import 'package:flutter/material.dart';
import 'package:project_1/pages/stateful_page.dart';
import 'package:project_1/widgets/primary_button.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main Page'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: PrimaryButton(
              text: 'Go to Stateful Widget',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const StatefulPage(),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
