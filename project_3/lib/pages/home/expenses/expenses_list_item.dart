import 'package:flutter/material.dart';
import 'package:project_3/models/expense_model.dart';
import 'package:project_3/theme.dart';
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
      subtitle: Text(expense.created.formatDate()),
      leading: _buildAmount(context),
      trailing: IconButton(
        icon: const Icon(Icons.delete),
        color: Theme.of(context).errorColor,
        onPressed: onTap,
      ),
    );
  }

  Widget _buildAmount(BuildContext context) {
    return Container(
      width: AppValues.amountCircleWidth,
      height: AppValues.amountCircleWidth,
      padding: const EdgeInsets.all(AppValues.defaultPadding),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppValues.fullRadius),
          color: Theme.of(context).primaryColor,
          boxShadow: [
            AppShadows.defaultBoxShadow,
          ]),
      child: FittedBox(
        child: Text(
          expense.amount.toCurrency(),
          style: Theme.of(context).primaryTextTheme.bodyText1,
        ),
      ),
    );
  }
}
