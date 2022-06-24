import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project_3/theme.dart';

class AppTextFormField extends StatelessWidget {
  final String label;
  final void Function(String?)? onSaved;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatters;

  const AppTextFormField({
    Key? key,
    required this.label,
    this.onSaved,
    this.controller,
    this.validator,
    this.inputFormatters,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: AppValues.defaultPadding),
      margin: const EdgeInsets.symmetric(vertical: AppValues.defaultMargin),
      child: TextFormField(
        controller: controller,
        onSaved: onSaved,
        validator: validator,
        inputFormatters: inputFormatters,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppValues.cardBorderRadius),
          ),
        ),
      ),
    );
  }
}
