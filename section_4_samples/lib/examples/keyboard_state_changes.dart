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
    return Column(
      children: [
        const TextField(
          decoration: InputDecoration(
            labelText: 'TextField',
          ),
        ),
        Expanded(
          child: Row(
            children: const [
              ColorContainer(
                color: Colors.blue,
                width: 100.0,
                height: double.infinity,
              ),
              Expanded(
                child: ColorContainer(
                  color: Colors.green,
                  height: double.infinity,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildPortrait() {
    return Column(
      children: const [
        TextField(
          decoration: InputDecoration(
            labelText: 'TextField',
          ),
        ),
        ColorContainer(
          color: Colors.red,
          width: double.infinity,
          height: 100.0,
        ),
        Expanded(
          child: ColorContainer(
            color: Colors.amber,
            width: double.infinity,
          ),
        )
      ],
    );
  }
}
