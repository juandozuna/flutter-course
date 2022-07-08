import 'package:flutter/material.dart';
import 'package:section_8/presentation/constants/theme.dart';

class ErrorContainer extends StatelessWidget {
  final String error;

  const ErrorContainer({
    Key? key,
    required this.error,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).errorColor,
        borderRadius: BorderRadius.circular(AppValues.roundBorderRadius),
      ),
      padding: const EdgeInsets.all(AppValues.horizontalMargin),
      margin: const EdgeInsets.all(AppValues.horizontalMargin),
      child: Text(
        error,
        style: Theme.of(context).textTheme.bodyText1!.apply(
              color: Colors.white,
            ),
      ),
    );
  }
}
