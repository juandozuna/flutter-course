import 'package:flutter/material.dart';
import 'package:project_3/pages/home/expenses/expenses_list_item.dart';
import 'package:project_3/providers/expenses_provider.dart';
import 'package:project_3/utils.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  void deleteItem(int i) {
    print('deleteItem: $i');
  }
}
