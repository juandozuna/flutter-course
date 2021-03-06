import 'package:flutter/material.dart';
import 'package:project_3/util_extensions.dart';
import 'package:project_3/utils.dart';
import 'package:project_3/viewModels/expenses_summary_view_model.dart';
import 'package:project_3/widgets/vertical_chart_bar.dart';

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
        FittedBox(
          child: Text(
            item.amount.toCurrency(),
          ),
        ),
        const SizedBox(height: 8),
        VerticalChartBar(fillValue: item.barPercentageFill),
        const SizedBox(height: 8),
        Text(
          getWeekDayInitial(item.weekDay),
        )
      ],
    );
  }
}
