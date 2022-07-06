import 'package:flutter/material.dart';
import 'package:section_5/pages/home/second_page.dart';
import 'package:section_5/theme/theme.dart';
import 'package:section_5/widgets/primary_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: PrimaryButton(
          label: 'Go To Next Pasge',
          onPressed: () => nextPage(context),
          color: AppColor.black,
        ),
      ),
    );
  }

  void nextPage(BuildContext context) {
    Navigator.pushNamed(context, SecondPage.routeName);
  }
}
