import 'package:flutter/material.dart';
import 'package:project_3/theme.dart';

class CenterLoadingProgress extends StatelessWidget {
  const CenterLoadingProgress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: AppValues.amountCircleWidth,
        width: AppValues.amountCircleWidth,
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(
            Theme.of(context).primaryColor,
          ),
        ),
      ),
    );
  }
}
