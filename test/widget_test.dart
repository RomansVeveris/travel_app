import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:travel_app/pages/first_page.dart';
import 'package:travel_app/pages/plan_a_trip.dart';
import 'package:travel_app/models/locals_model.dart';
import 'package:travel_app/pages/main_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  testWidgets("First page shows 2 categories", (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: Scaffold(
      body: MyScreen(),
    )));
    await tester.pumpAndSettle();
    expect(find.text("AI Insights Today"), findsOneWidget);
    expect(find.text("Locals by AI"), findsOneWidget);
  }); 

  testWidgets('PlanATrip initial amount and input capping', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: PlanATrip(local: LocalsModel(
          name: "0",
          description: "0",
          bgPath: "0",
          descColor: Colors.black,
          fadeColor: Colors.black,
        )),
      ),
    ));

    final textFieldFinder = find.byType(TextField);
    expect(textFieldFinder, findsOneWidget);

    TextField textField = tester.widget(textFieldFinder);
    expect(textField.controller!.text, '1200.00');

    textField.controller!.text = '3000.00';
    await tester.pump();
    expect(textField.controller!.text, '2000.00');
  });

  testWidgets('BottomNav highlights selected item', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(body: MainScreen()),
      ),
    );

    await tester.pumpAndSettle();

    final menuIcon = find.byWidgetPredicate(
      (widget) => widget is SvgPicture && widget.key == const ValueKey('menu-square-svg'),
    );

    expect(menuIcon, findsOneWidget);

    await tester.tap(menuIcon);
    await tester.pumpAndSettle();
    expect(find.text('Must-See Today'), findsOneWidget);

  });
}
