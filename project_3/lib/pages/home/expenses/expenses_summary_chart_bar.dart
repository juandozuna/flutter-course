import 'package:flutter/material.dart';
import 'package:project_3/theme.dart';
import 'package:project_3/util_extensions.dart';
import 'package:project_3/utils.dart';
import 'package:project_3/viewModels/expenses_summary_view_model.dart';
import 'package:project_3/widgets/horizontal_bar.dart';
import 'package:project_3/widgets/verticar_bar.dart';

class ExpensesSummaryChartBar extends StatelessWidget {
  final ExpenseSummaryItem item;

  const ExpensesSummaryChartBar({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isBigScreen =
        MediaQuery.of(context).size.width > AppScreenSizes.smWidth;
    final percentage = item.barPercentageFill / 100;
    final children = [
      RotatedBox(
        quarterTurns: isBigScreen ? -1 : 0,
        child: Text(item.amount.toCurrency()),
      ),
      isBigScreen
          ? HorizontalBar(percentage: percentage)
          : VerticarBar(percentage: percentage),
      Text(getWeekDayInitial(item.weekDay))
    ];
    return isBigScreen ? Row(children: children) : Column(children: children);
  }
}
