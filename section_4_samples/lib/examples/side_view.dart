import 'package:flutter/material.dart';
import 'package:section_4_samples/widget/color_container.dart';

class SideView extends StatelessWidget {
  const SideView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ColorContainer(
      color: Colors.amber,
      width: double.infinity,
      height: double.infinity,
      child: Center(
        child: Text('Side View'),
      ),
    );
  }
}
