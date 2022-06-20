import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final String label;
  final Widget? child;
  final VoidCallback? onPressed;

  const PrimaryButton({
    Key? key,
    required this.label,
    this.onPressed,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        padding: _propertySetter(
          const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        ),
        shape: _propertySetter(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
        ),
      ),
      child: child ?? Text(label),
    );
  }

  MaterialStateProperty<T> _propertySetter<T>(T value) =>
      MaterialStateProperty.all(value);
}
