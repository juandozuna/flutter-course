import 'package:flutter/material.dart';
import 'package:project_3/pages/home/expenses/expenses_list_item.dart';
import 'package:project_3/providers/expenses_provider.dart';
import 'package:project_3/utils.dart';
import 'package:project_3/widgets/center_loading_progress.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final expensesProvider = getProvider<ExpensesProvider>(context);
    final expenses = expensesProvider.getSortedExpenses();

    if (expensesProvider.isLoading) {
      return const CenterLoadingProgress();
    }

    if (expenses.isEmpty) {
      return const Center(
        child: Text('Todavía no hay gastos'),
      );
    }

    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (context, index) => ExpensesListItem(
        expense: expenses[index],
      ),
    );
  }
}
