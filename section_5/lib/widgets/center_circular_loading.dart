import 'package:flutter/material.dart';

class CenterCircularLoading extends StatelessWidget {
  const CenterCircularLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
