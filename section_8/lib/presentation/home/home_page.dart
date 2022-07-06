import 'package:flutter/material.dart';
import 'package:section_8/injector.dart';
import 'package:section_8/presentation/chat/chat_screen.dart';
import 'package:section_8/presentation/providers/auth_provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Chat Screen'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              get<AuthProvider>().signOut();
            },
          ),
        ],
      ),
      body: ChatScreen(),
    );
  }
}
