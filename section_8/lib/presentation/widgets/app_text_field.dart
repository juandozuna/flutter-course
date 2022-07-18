import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:section_8/presentation/constants/theme.dart';

class AppTextField extends StatelessWidget {
  final Key? key;
  final String labelKey;
  final String? initialValue;
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final void Function(String?)? onSaved;
  final void Function(String)? onFieldSubmitted;
  final FocusNode? focusNode;
  final FocusNode? nextFocusNode;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputAction? textInputAction;
  final List<FieldValidator>? validators;
  final bool obscureText;

  const AppTextField({
    this.key,
    required this.labelKey,
    this.onChanged,
    this.onSaved,
    this.initialValue,
    this.controller,
    this.focusNode,
    this.nextFocusNode,
    this.inputFormatters,
    this.validators,
    this.textInputAction,
    this.keyboardType,
    this.obscureText = false,
    this.onFieldSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    final multiValidator = MultiValidator([...validators ?? []]);
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: AppValues.horizontalMargin,
        vertical: AppValues.verticalMargin,
      ),
      child: TextFormField(
        key: key,
        decoration: InputDecoration(
          labelText: translate(labelKey),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              AppValues.inputBorderRadius,
            ),
            borderSide: BorderSide(
              color: Theme.of(context).primaryColor,
              width: AppValues.inputBorderWidth,
              style: BorderStyle.solid,
            ),
          ),
        ),
        initialValue: initialValue,
        controller: controller,
        onChanged: onChanged,
        onSaved: onSaved,
        focusNode: focusNode,
        keyboardType: keyboardType,
        inputFormatters: inputFormatters,
        validator: multiValidator,
        obscureText: obscureText,
        textInputAction: nextFocusNode == null
            ? (textInputAction ?? TextInputAction.done)
            : TextInputAction.next,
        onFieldSubmitted: (String value) {
          if (nextFocusNode != null) {
            nextFocusNode!.requestFocus();
          }

          if (onFieldSubmitted != null) {
            onFieldSubmitted!(value);
          }
        },
      ),
    );
  }
}
