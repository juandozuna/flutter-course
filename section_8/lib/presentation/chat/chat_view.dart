import 'package:flutter/material.dart';
import 'package:section_8/domain/models/chat_message_model.dart';
import 'package:section_8/injector.dart';
import 'package:section_8/presentation/chat/chat_bubble.dart';
import 'package:section_8/presentation/providers/chat_provider.dart';

class ChatView extends StatelessWidget {
  const ChatView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<ChatMessageModel>>(
      stream: get<ChatProvider>().messages,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final data = snapshot.data!;
          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              final message = data[index];
              return FutureBuilder<bool>(
                future: get<ChatProvider>().isMessageMe(message),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final isMe = snapshot.data!;
                    return ChatBubble(
                      message: message,
                      isMe: isMe,
                    );
                  } else {
                    return Container();
                  }
                },
              );
            },
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
