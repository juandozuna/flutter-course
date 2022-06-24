import 'package:flutter/material.dart';
import 'package:project_3/util_extensions.dart';
import 'package:project_3/utils.dart';
import 'package:project_3/viewModels/expenses_summary_view_model.dart';
import 'package:project_3/widgets/verticar_bar.dart';

class ExpensesSummaryChartBar extends StatelessWidget {
  final ExpenseSummaryItem item;

  const ExpensesSummaryChartBar({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(item.amount.toCurrency()),
        VerticarBar(percentage: item.barPercentageFill / 100),
        Text(getWeekDayInitial(item.weekDay))
      ],
    );
  }
}
