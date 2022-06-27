import 'package:flutter/material.dart';
import 'package:section_4_samples/examples/list_view.dart';
import 'package:section_4_samples/examples/side_view.dart';
import 'package:section_4_samples/examples/side_view_page.dart';

const lgWidth = 800;

class SamplePage extends StatelessWidget {
  const SamplePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Title'),
      ),
      body: LayoutBuilder(builder: (context, constraints) {
        final isBig = constraints.maxWidth > lgWidth;
        final lv =
            AppListView(onItemTap: (p0) => onItemTap(constraints, context));

        final big = Row(
          children: [
            SizedBox(
              width: 200,
              child: lv,
            ),
            Expanded(
              child: SideView(),
            )
          ],
        );

        return isBig ? big : lv;
      }),
    );
  }

  void onItemTap(BoxConstraints constraints, BuildContext context) {
    final isBig = constraints.maxWidth > lgWidth;

    if (!isBig) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (c) => SideViewPage()));
    }
  }
}
