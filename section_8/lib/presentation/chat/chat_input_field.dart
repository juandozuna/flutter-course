import 'package:flutter/material.dart';
import 'package:section_8/presentation/constants/theme.dart';

class ChatInputField extends StatefulWidget {
  const ChatInputField({Key? key}) : super(key: key);

  @override
  State<ChatInputField> createState() => _ChatInputFieldState();
}

class _ChatInputFieldState extends State<ChatInputField> {
  final _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final radius = Radius.circular(AppValues.roundBorderRadius);
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Theme.of(context).primaryColor,
          width: 1,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(child: _buildTextField()),
          _sendButton(),
        ],
      ),
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

  void sendMessage() {
    final message = _textController.text;

    setState(() => _textController.clear());
  }
}
