import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:section_8/presentation/constants/theme.dart';
import 'package:section_8/util.dart';

class PrimaryButton extends StatelessWidget {
  final String labelKey;
  final VoidCallback? onPressed;
  final Color? color;

  const PrimaryButton({
    Key? key,
    required this.labelKey,
    this.onPressed,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: AppValues.horizontalMargin,
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: propertySetter(
            color ?? Theme.of(context).primaryColor,
          ),
        ),
        child: SizedBox(
          width: double.infinity,
          child: Text(translate(labelKey)),
        ),
      ),
    );
  }
}
