import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:section_5/injector.dart';
import 'package:section_5/providers/users_provider.dart';
import 'package:section_5/widgets/primary_button.dart';

class SecondPage extends StatefulWidget {
  static const String routeName = '/second';
  const SecondPage({Key? key}) : super(key: key);

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  Uint8List? image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Page'),
      ),
      body: Column(
        children: [
          Center(
              child: PrimaryButton(
            label: 'Take Picture',
            onPressed: signOut,
          )),
          if (image != null)
            Expanded(
              child: Image.memory(image!),
            )
        ],
      ),
    );
  }

  void signOut() async {
    final picker = ImagePicker();

    final imagen = await picker.pickImage(source: ImageSource.camera);

    if (imagen != null) {
      final bytes = await imagen.readAsBytes();
      setState(() => image = bytes);
    }
  }
}
