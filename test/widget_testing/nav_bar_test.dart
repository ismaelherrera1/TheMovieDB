import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:the_movie_db/src/presentation/widgets/nav_bar.dart';

void main() {
  testWidgets('transition from active Home button to About Us active button',
      (WidgetTester tester) async {
    int selectedItem = 0;
    PageController controller = PageController();

    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: PageView(
          controller: controller,
          children: const [Scaffold(), Scaffold()],
        ),
        bottomNavigationBar: NavBar(
          selectedItem: selectedItem,
          controller: controller,
        ),
      ),
    ));
    await tester.tap(
      find.byKey(
        const Key('helpIcon'),
      ),
    );
    await tester.pumpAndSettle();

    expect(controller.page, 1);
  });
}
