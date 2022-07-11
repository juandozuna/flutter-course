import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:section_8/domain/models/chat_message_model.dart';
import 'package:section_8/injector.dart';
import 'package:section_8/presentation/constants/theme.dart';
import 'package:section_8/presentation/providers/chat_provider.dart';
import 'package:section_8/presentation/widgets/centered_circular_loading.dart';

class ChatBubble extends StatelessWidget {
  final bool isMe;
  final ChatMessageModel message;
  final ChatProvider chatProvider = get();

  ChatBubble({
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

    final bubbleWidth = MediaQuery.of(context).size.width * 0.6;

    final bubble = Expanded(
      child: Container(
        margin: EdgeInsets.symmetric(
          vertical: AppValues.verticalMargin,
          horizontal: AppValues.horizontalMargin,
        ),
        child: Column(
          crossAxisAlignment:
              isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(AppValues.horizontalMargin),
              width: bubbleWidth,
              decoration: BoxDecoration(
                borderRadius: borderRadius,
                color:
                    !isMe ? Theme.of(context).primaryColor : Colors.grey[300],
              ),
              child: Column(
                crossAxisAlignment:
                    isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                children: [
                  Text(
                    '${message.message}',
                    textAlign: !isMe ? TextAlign.left : TextAlign.right,
                  ),
                  if (message.type == ChatMessageType.picture)
                    FutureBuilder<Uint8List?>(
                      future: chatProvider.getImage(message.fileLocation!),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return CenteredCircularLoading();
                        }
                        if (snapshot.hasData) {
                          return Image.memory(
                            snapshot.data!,
                            fit: BoxFit.cover,
                          );
                        } else {
                          return Container();
                        }
                      },
                    )
                ],
              ),
            ),
            if (message.location != null)
              Text(
                '(${message.location!.latitude}, ${message.location!.longitude})',
              ),
            if (message.geocoded != null)
              Text(
                '${message.geocoded?.neighbourhood ?? ''}',
              ),
          ],
        ),
      ),
    );

    return bubble;
  }
}
