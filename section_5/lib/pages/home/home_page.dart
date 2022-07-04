import 'package:flutter/material.dart';
import 'package:section_5/injector.dart';
import 'package:section_5/pages/home/camera_page.dart';
import 'package:section_5/providers/users_provider.dart';
import 'package:section_5/theme/theme.dart';
import 'package:section_5/util.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: [
            createButton(() {
              Navigator.of(context).pushNamed(CameraPage.routeName);
            }, 'Camera'),
            createButton(logOut, 'Log Out', AppColor.black),
          ],
        ),
      ),
    );
  }

  Widget createButton(VoidCallback onPress, String text, [Color? color]) =>
      Padding(
        padding: const EdgeInsets.all(AppValues.horizontalMargin),
        child: ElevatedButton(
          onPressed: onPress,
          style: ButtonStyle(
            backgroundColor: propertySetter(color ?? AppColor.primary),
          ),
          child: Container(
            width: double.infinity,
            child: Text(
              text,
            ),
          ),
        ),
      );

  void logOut() async {
    final userProvider = get<UserProvider>();
    await userProvider.logOut();
    userProvider.naviagteUserOnLogout();
  }
}
