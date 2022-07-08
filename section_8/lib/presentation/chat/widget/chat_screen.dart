import 'package:flutter/material.dart';
import 'package:section_8/presentation/chat/chat_input_field.dart';
import 'package:section_8/presentation/chat/chat_view.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(child: ChatView()),
        ChatInputField(),
      ],
    );
  }
}
