import 'package:cupertino_ui/cupertino_ui.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:not_apple_developer/main.dart';

void main() {
  testWidgets('shows the main navigation', (tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Discover'), findsWidgets);
    expect(find.text('Browse'), findsOneWidget);
    expect(find.text('WWDC'), findsOneWidget);
    expect(find.text('Account'), findsOneWidget);
    expect(find.text('Search'), findsOneWidget);

    await tester.tap(find.text('Browse'));
    await tester.pumpAndSettle();
    expect(find.text('Topics'), findsOneWidget);

    await tester.tap(find.text('Search'));
    await tester.pumpAndSettle();
    expect(find.byType(CupertinoSearchTextField), findsOneWidget);
  });
}
