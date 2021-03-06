import 'package:flutter/material.dart';
import 'package:project_3/pages/home/expenses/expenses_list.dart';
import 'package:project_3/pages/home/expenses/expenses_summary_chart.dart';
import 'package:project_3/widgets/home_app_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HomeAppBar(),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Column(
      children: const [
        ExpensesSummaryChart(),
        Expanded(
          child: ExpensesList(),
        )
      ],
    );
  }
}
