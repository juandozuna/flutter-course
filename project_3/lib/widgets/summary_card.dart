import 'package:flutter/material.dart';

class SummaryCard extends StatelessWidget {
  final Widget? child;
  const SummaryCard({
    Key? key,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: child,
    );
  }
}
