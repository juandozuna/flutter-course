import 'package:flutter/material.dart';
import 'package:section_8/presentation/chat/chat_bubble.dart';

class ChatView extends StatelessWidget {
  const ChatView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      reverse: true,
      itemBuilder: (context, index) {
        return ChatBubble(
          isMe: index % 2 == 0,
          text: index.toString(),
        );
      },
    );
  }
}
