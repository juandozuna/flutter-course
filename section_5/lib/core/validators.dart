import 'package:form_field_validator/form_field_validator.dart';

class MinValueValidator extends TextFieldValidator {
  final double min;

  MinValueValidator(
    this.min, {
    String errorText = 'The input value was too small',
  }) : super(errorText);

  @override
  bool get ignoreEmptyValues => false;

  @override
  bool isValid(String? value) {
    if (value == null) {
      return false;
    }
    return double.parse(value) >= min;
  }
}

class MaxValueValidator extends TextFieldValidator {
  final double max;

  MaxValueValidator(
    this.max, {
    String errorText = 'The input value was too high',
  }) : super(errorText);

  @override
  bool get ignoreEmptyValues => false;

  @override
  bool isValid(String? value) {
    if (value == null) {
      return false;
    }
    return double.parse(value) < max;
  }
}
