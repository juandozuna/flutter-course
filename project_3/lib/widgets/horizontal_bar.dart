import 'package:flutter/material.dart';
import 'package:project_3/theme.dart';

class HorizontalBar extends StatelessWidget {
  /// A percentage value between 0.0 and 1.0.
  final double percentage;

  const HorizontalBar({Key? key, required this.percentage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _buildBar(),
        Positioned(
          bottom: 0,
          child: _buildBar(
            true,
            Theme.of(context).primaryColor,
          ),
        )
      ],
    );
  }

  Widget _buildBar([
    bool usePercentage = false,
    Color color = AppColors.verticalBarBackground,
  ]) {
    return Container(
      width: usePercentage
          ? AppValues.verticalBarHeight * percentage
          : AppValues.verticalBarHeight,
      height: AppValues.verticalBarWidth,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppValues.fullRadius),
        color: color,
      ),
    );
  }
}
