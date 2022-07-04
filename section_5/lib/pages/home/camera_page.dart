import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:section_5/theme/theme.dart';
import 'package:section_5/util.dart';

class CameraPage extends StatefulWidget {
  static const String routeName = '/camera';

  const CameraPage({Key? key}) : super(key: key);

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  Uint8List? _image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Camera Page'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          createButton(() {
            takePicture();
          }, 'Take Picture'),
          if (_image != null) Expanded(child: Image.memory(_image!)),
        ],
      ),
    );
  }

  Widget createButton(VoidCallback onPress, String text, [Color? color]) =>
      Padding(
        padding: const EdgeInsets.all(AppValues.horizontalMargin),
        child: ElevatedButton(
          onPressed: onPress,
          style: ButtonStyle(
            backgroundColor: propertySetter(color ?? AppColor.primary),
          ),
          child: Container(
            width: double.infinity,
            child: Text(
              text,
            ),
          ),
        ),
      );

  void takePicture() async {
    print('take picture');
    final picker = ImagePicker();
    final result = await picker.pickImage(source: ImageSource.camera);
    if (result == null) return;
    final image = await result.readAsBytes();
    setState(() {
      _image = image;
    });
  }
}
