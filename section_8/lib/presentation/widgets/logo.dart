import 'package:flutter/material.dart';
import 'package:section_8/presentation/constants/assets.dart';

class Logo extends StatelessWidget {
  const Logo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(Assets.images.logo);
  }
}
