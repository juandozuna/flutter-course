import 'package:flutter/material.dart';
import 'package:section_5/theme/theme.dart';
import 'package:section_5/util.dart';

class PrimaryButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final Color? color;

  const PrimaryButton({
    Key? key,
    required this.label,
    this.onPressed,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: AppValues.horizontalMargin),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: propertySetter(
            color ?? Theme.of(context).primaryColor,
          ),
        ),
        child: Container(
          width: double.infinity,
          child: Text(label),
        ),
      ),
    );
  }
}
