import 'package:flutter/material.dart';
import 'package:project_3/theme.dart';

class SummaryCard extends StatelessWidget {
  final Widget? child;
  const SummaryCard({
    Key? key,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppValues.defaultPadding,
        vertical: AppValues.cardVertical,
      ),
      margin: const EdgeInsets.all(AppValues.defaultMargin),
      decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(AppValues.cardBorderRadius),
          boxShadow: [
            AppShadows.defaultBoxShadow,
          ]),
      child: child,
    );
  }
}
