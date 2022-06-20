import 'package:flutter/material.dart';

class TLTextFormField extends StatelessWidget {
  final String label;
  final void Function(String?)? onSaved;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  const TLTextFormField({
    Key? key,
    required this.label,
    this.onSaved,
    this.controller,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      margin: const EdgeInsets.symmetric(vertical: 20),
      child: TextFormField(
        controller: controller,
        onSaved: onSaved,
        validator: validator,
        decoration: InputDecoration(
            labelText: label,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(100),
            )),
      ),
    );
  }
}
