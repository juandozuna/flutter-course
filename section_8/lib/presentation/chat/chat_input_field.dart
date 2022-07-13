import 'package:adaptive_action_sheet/adaptive_action_sheet.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:section_8/domain/enums/chat_image_source.dart';
import 'package:section_8/injector.dart';
import 'package:section_8/presentation/providers/chat_provider.dart';
import 'package:section_8/presentation/widgets/centered_circular_loading.dart';

class ChatInputField extends StatefulWidget {
  const ChatInputField({Key? key}) : super(key: key);

  @override
  State<ChatInputField> createState() => _ChatInputFieldState();
}

class _ChatInputFieldState extends State<ChatInputField> {
  final _textController = TextEditingController();
  final _chatProvider = get<ChatProvider>();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Theme.of(context).primaryColor,
          width: 1,
        ),
      ),
      child: Consumer<ChatProvider>(builder: (context, value, child) {
        if (value.isLoading) {
          return CenteredCircularLoading();
        }
        return Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(child: _buildTextField()),
            _sendButton(),
            _sendImageButton(context),
          ],
        );
      }),
    );
  }

  Widget _buildTextField() {
    return TextField(
      controller: _textController,
      decoration: InputDecoration(
        border: InputBorder.none,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        labelText: 'Type a message',
      ),
    );
  }

  Widget _sendButton() {
    return IconButton(
      icon: Icon(Icons.send),
      onPressed: sendMessage,
    );
  }

  Widget _sendImageButton(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.attach_file),
      onPressed: () => sendImage(context),
    );
  }

  void sendImage(BuildContext context) async {
    ChatImageSource? chosen;
    await showAdaptiveActionSheet(
      actions: [
        BottomSheetAction(
            title: Text('Camera'),
            onPressed: () {
              chosen = ChatImageSource.camera;
              Navigator.pop(context);
            }),
        BottomSheetAction(
            title: Text('Gallery'),
            onPressed: () {
              chosen = ChatImageSource.gallery;
              Navigator.pop(context);
            }),
      ],
      cancelAction: CancelAction(title: Text('Cancel')),
      context: context,
    );

    if (chosen == null) {
      return;
    }

    final message = _textController.text;
    _chatProvider.sendPictureMessage(message, chosen!);

    setState(() => _textController.clear());
  }

  void sendMessage() {
    final message = _textController.text;

    _chatProvider.sendMessage(message);

    setState(() => _textController.clear());
  }
}
