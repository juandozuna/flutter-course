import 'package:flutter/material.dart';

class ColorContainer extends StatelessWidget {
  final Color? color;
  final Widget? child;
  final double? width;
  final double? height;

  const ColorContainer({
    Key? key,
    this.color,
    this.child,
    this.width,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: const EdgeInsets.all(8.0),
      margin: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: child,
    );
  }
}
