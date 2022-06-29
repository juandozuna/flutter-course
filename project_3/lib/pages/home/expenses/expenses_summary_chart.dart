import 'package:flutter/material.dart';
import 'package:project_3/pages/home/expenses/expenses_summary_chart_bar.dart';
import 'package:project_3/providers/expenses_provider.dart';
import 'package:project_3/theme.dart';
import 'package:project_3/utils.dart';
import 'package:project_3/viewModels/expenses_summary_view_model.dart';
import 'package:project_3/widgets/summary_card.dart';

class ExpensesSummaryChart extends StatelessWidget {
  const ExpensesSummaryChart({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isBigScreen =
        MediaQuery.of(context).size.width > AppScreenSizes.smWidth;
    final expensesProvider = getProvider<ExpensesProvider>(context);
    final hasExpenses = expensesProvider.hasExpenses;

    if (!hasExpenses) {
      return const SizedBox.shrink();
    }

    final viewModel = expensesProvider.getSummaryViewModel();

    return SummaryCard(
      child: isBigScreen
          ? Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: _buildChart(viewModel),
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: _buildChart(viewModel),
            ),
    );
  }

  List<Widget> _buildChart(ExpensesSummaryViewModel viewModel) {
    final items = viewModel.summaryItems;

    return items
        .map((e) => ExpensesSummaryChartBar(key: ObjectKey(e), item: e))
        .toList();
  }
}
