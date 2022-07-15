import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:section_8/presentation/constants/assets.dart';
import 'package:section_8/presentation/constants/theme.dart';
import 'package:section_8/presentation/widgets/logo.dart';

void main() {
  testWidgets('should render logo correctly', (tester) async {
    await tester.pumpWidget(Logo());
    await tester.pumpAndSettle();

    final imageFinder = find.byType(Image);

    final imageWidget = tester.firstWidget(imageFinder) as Image;

    expect(imageWidget.width, AppValues.logoSize);
    expect(imageWidget.height, AppValues.logoSize);

    final imageProvider = imageWidget.image as AssetImage;
    expect(imageProvider.assetName, Assets.images.logo);
  });
}
