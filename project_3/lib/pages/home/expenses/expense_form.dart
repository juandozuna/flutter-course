import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:project_3/models/expense_model.dart';
import 'package:project_3/providers/expenses_provider.dart';
import 'package:project_3/utils.dart';
import 'package:project_3/widgets/text_form_field.dart';

class ExpenseForm extends StatefulWidget {
  const ExpenseForm({Key? key}) : super(key: key);

  @override
  _ExpenseFormState createState() => _ExpenseFormState();
}

class _ExpenseFormState extends State<ExpenseForm> {
  final _formKey = GlobalKey<FormState>();

  String _descriptionText = '';
  DateTime _date = DateTime.now();
  double _amount = 0.0;

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
              onSaved: (value) => _descriptionText = value ?? '',
            ),
            DateTimePicker(
              initialDate: DateTime.now(),
              firstDate: DateTime(2000),
              lastDate: DateTime.now(),
              type: DateTimePickerType.date,
              onSaved: (value) => _date = DateTime.parse(value!),
            ),
            AppTextFormField(
              label: 'Monto',
              validator: MultiValidator([
                RequiredValidator(errorText: 'Requerido'),
                MinLengthValidator(1, errorText: 'Minimo 1 caracter'),
              ]),
              onSaved: (value) => _amount = double.parse(value ?? '0'),
            ),
            ElevatedButton(
                onPressed: () => onSubmitForm(), child: Text('Submit'))
          ],
        ),
      ),
    );
  }

  void onSubmitForm() {
    final form = _formKey.currentState!;

    final isValid = form.validate();
    if (!isValid) {
      return;
    }

    form.save();

    final newExpense = ExpenseModel(
      amount: _amount,
      description: _descriptionText,
      created: _date,
    );

    final provider = getProvider<ExpensesProvider>(context, false);
    provider.addExpenseItem(newExpense);

    FocusScope.of(context).requestFocus(FocusNode());

    Navigator.pop(context);
  }
}
