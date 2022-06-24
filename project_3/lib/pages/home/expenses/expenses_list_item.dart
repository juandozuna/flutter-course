import 'package:flutter/material.dart';
import 'package:project_3/models/expense_model.dart';
import 'package:project_3/util_extensions.dart';

class ExpensesListItem extends StatelessWidget {
  final ExpenseModel expense;
  final VoidCallback? onTap;

  const ExpensesListItem({
    Key? key,
    required this.expense,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Text(expense.description),
        subtitle: Text(expense.created.formatDate()));
  }

  Widget _buildAmount(BuildContext context) {
    return Container();
  }
}
