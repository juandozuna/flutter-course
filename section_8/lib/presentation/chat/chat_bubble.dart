import 'package:flutter/material.dart';
import 'package:section_8/domain/models/chat_message_model.dart';
import 'package:section_8/presentation/constants/theme.dart';

class ChatBubble extends StatelessWidget {
  final bool isMe;
  final ChatMessageModel message;

  const ChatBubble({
    Key? key,
    required this.isMe,
    required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.only(
      topLeft: Radius.circular(!isMe ? 0 : AppValues.roundBorderRadius),
      topRight: Radius.circular(!isMe ? AppValues.roundBorderRadius : 0),
      bottomLeft: Radius.circular(AppValues.roundBorderRadius),
      bottomRight: Radius.circular(AppValues.roundBorderRadius),
    );

    final bubbleWidth = MediaQuery.of(context).size.width * 0.3;

    final bubble = Expanded(
      child: Container(
        padding: EdgeInsets.all(AppValues.horizontalMargin),
        width: bubbleWidth,
        margin: EdgeInsets.symmetric(
          vertical: AppValues.verticalMargin,
          horizontal: AppValues.horizontalMargin,
        ),
        decoration: BoxDecoration(
          borderRadius: borderRadius,
          color: !isMe ? Theme.of(context).primaryColor : Colors.grey[300],
        ),
        child: Text(
          '${message.message}:  ${message.location?.toString() ?? ''}',
          textAlign: !isMe ? TextAlign.left : TextAlign.right,
        ),
      ),
    );

    final sizedBox = SizedBox(
      width: bubbleWidth,
    );

    return Row(
      children: [
        if (isMe) sizedBox,
        bubble,
        if (!isMe) sizedBox,
      ],
    );
  }
}
