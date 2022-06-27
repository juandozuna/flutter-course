import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:project_3/utils.dart';
import 'package:project_3/widgets/text_form_field.dart';

class ExpenseForm extends StatefulWidget {
  const ExpenseForm({Key? key}) : super(key: key);

  @override
  _ExpenseFormState createState() => _ExpenseFormState();
}

class _ExpenseFormState extends State<ExpenseForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            AppTextFormField(
              label: 'Descripcion',
              validator: MultiValidator([
                RequiredValidator(errorText: 'Requerido'),
                MinLengthValidator(3, errorText: 'Minimo 3 caracteres'),
              ]),
            ),
            DateTimePicker(
              initialDate: DateTime.now(),
              firstDate: DateTime(2000),
              lastDate: DateTime.now(),
              type: DateTimePickerType.date,
            ),
            AppTextFormField(
              label: 'Monto',
              inputFormatters: [
                CurrencyInputFormatter(),
              ],
              validator: MultiValidator([
                RequiredValidator(errorText: 'Requerido'),
                MinLengthValidator(1, errorText: 'Minimo 1 caracter'),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
