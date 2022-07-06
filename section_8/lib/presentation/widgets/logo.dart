import 'package:flutter/material.dart';
import 'package:section_8/presentation/constants/assets.dart';
import 'package:section_8/presentation/constants/theme.dart';

class Logo extends StatelessWidget {
  const Logo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      Assets.images.logo,
      width: AppValues.logoSize,
      height: AppValues.logoSize,
    );
  }
}
