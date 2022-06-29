import 'package:flutter/material.dart';
import 'package:section_4_samples/widget/color_container.dart';

class KeyboardStateChanges extends StatelessWidget {
  const KeyboardStateChanges({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;

    return isPortrait ? _buildPortrait() : _buildLandscape();
  }

  Widget _buildLandscape() {
    return Row(
      children: _buildChildren(true),
    );
  }

  Widget _buildPortrait() {
    return Column(
      children: _buildChildren(),
    );
  }

  List<Widget> _buildChildren([bool isLandscape = false]) {
    return [
      ColorContainer(
        color: Colors.red,
        width: isLandscape ? 100 : double.infinity,
        height: 100.0,
      ),
      Expanded(
        child: ColorContainer(
          color: Colors.amber,
          width: isLandscape ? null : double.infinity,
          height: isLandscape ? double.infinity : null,
        ),
      )
    ];
  }
}
