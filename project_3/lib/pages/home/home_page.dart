import 'package:flutter/material.dart';
import 'package:project_3/pages/home/expenses/expenses_list.dart';
import 'package:project_3/pages/home/expenses/expenses_summary_chart.dart';
import 'package:project_3/providers/expenses_provider.dart';
import 'package:project_3/utils.dart';
import 'package:project_3/widgets/home_app_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      _getInitialData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HomeAppBar(),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Column(
      children: [
        ExpensesSummaryChart(),
        Expanded(child: ExpensesList()),
      ],
    );
  }

  void _getInitialData() {
    final provider = getProvider<ExpensesProvider>(context, false);
    provider.getExpensesFromRepo();
  }
}
