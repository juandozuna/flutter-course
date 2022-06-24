import 'package:flutter/material.dart';
import 'package:project_3/theme.dart';

class VerticalChartBar extends StatelessWidget {
  final double fillValue;

  const VerticalChartBar({
    Key? key,
    required this.fillValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _buildBar(),
        _buildBar(
          fillValue,
          Theme.of(context).primaryColor,
        )
      ],
    );
  }

  Widget _buildBar([
    double percentage = 100,
    Color color = AppColors.verticalBarBackground,
  ]) {
    final decimalPercentage = percentage / 100;
    return Container(
      height: AppValues.verticalBarHeight,
      width: AppValues.verticalBarWidth * decimalPercentage,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppValues.fullRadius),
        color: color,
      ),
    );
  }
}
