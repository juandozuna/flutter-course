import 'package:flutter/material.dart';
import 'package:project_3/providers/expenses_provider.dart';
import 'package:project_3/theme.dart';
import 'package:project_3/utils.dart';

class HomeAppBar extends StatelessWidget with PreferredSizeWidget {
  const HomeAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Gastos Personales'),
      actions: [
        IconButton(
          icon: const Icon(Icons.add),
          onPressed: () => addItem(context),
        ),
      ],
    );
  }

  void addItem(BuildContext context) {
    final provider = getProvider<ExpensesProvider>(context, false);
    provider.addItem();
  }

  @override
  Size get preferredSize => const Size.fromHeight(AppValues.appBarHeight);
}
