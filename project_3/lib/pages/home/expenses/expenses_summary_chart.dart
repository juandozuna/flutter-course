import 'package:flutter/material.dart';
import 'package:project_3/pages/home/expenses/expenses_summary_chart_bar.dart';
import 'package:project_3/providers/expenses_provider.dart';
import 'package:project_3/utils.dart';
import 'package:project_3/viewModels/expenses_summary_view_model.dart';
import 'package:project_3/widgets/summary_card.dart';

class ExpensesSummaryChart extends StatelessWidget {
  const ExpensesSummaryChart({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SummaryCard(child: Container());
  }
}
