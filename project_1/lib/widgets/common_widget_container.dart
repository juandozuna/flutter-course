import 'package:flutter/material.dart';

class CommonWidgetContainer extends StatelessWidget {
  final Widget child;

  const CommonWidgetContainer({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.grey[300],
        boxShadow: const [
          BoxShadow(
            color: Colors.black45,
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      padding: const EdgeInsets.all(18.0),
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
      child: Center(child: child),
    );
  }
}
