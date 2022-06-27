import 'package:flutter/material.dart';
import 'package:project_3/models/expense_model.dart';
import 'package:project_3/providers/expenses_provider.dart';
import 'package:project_3/theme.dart';
import 'package:project_3/util_extensions.dart';
import 'package:project_3/utils.dart';

class ExpensesListItem extends StatelessWidget {
  final ExpenseModel expense;

  const ExpensesListItem({
    Key? key,
    required this.expense,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: _buildAmount(context),
      trailing: _buildButton(context),
      title: Text(expense.description),
      subtitle: Text(expense.created.formatDate()),
    );
  }

  Widget _buildAmount(BuildContext context) {
    return Container(
      width: AppValues.amountCircleWidth,
      height: AppValues.amountCircleWidth,
      padding: const EdgeInsets.symmetric(horizontal: AppValues.defaultPadding),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        shape: BoxShape.circle,
      ),
      child: FittedBox(
        child: Text(
          expense.amount.toCurrency(),
          style: Theme.of(context).primaryTextTheme.headline6,
        ),
      ),
    );
  }

  Widget _buildButton(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.delete),
      onPressed: () => onDelete(context),
    );
  }

  void onDelete(BuildContext context) {
    final id = expense.id!;

    final expensesProvider = getProvider<ExpensesProvider>(context, false);

    expensesProvider.deleteExpense(id);
  }
}
