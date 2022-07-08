import 'package:flutter/material.dart';
import 'package:section_8/injector.dart';
import 'package:section_8/presentation/chat/chat_screen.dart';
import 'package:section_8/presentation/providers/auth_provider.dart';
import 'package:section_8/presentation/providers/chat_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, init);
  }

  @override
  void dispose() {
    stop();
    super.dispose();
  }

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

  void init() {
    get<ChatProvider>().startListeningToMessages();
  }

  void stop() {
    get<ChatProvider>().stopListeningToMessages();
  }
}
