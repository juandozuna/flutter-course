import 'package:flutter/material.dart';

class CenteredCircularLoading extends StatelessWidget {
  final bool inverted;

  const CenteredCircularLoading({
    Key? key,
    this.inverted = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(
          inverted ? Colors.white : Theme.of(context).primaryColor,
        ),
      ),
    );
  }
}
