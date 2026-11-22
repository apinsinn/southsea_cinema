import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/main.dart';

void main() {
  testWidgets('Basic app loading test', (WidgetTester tester) async {
    await tester.pumpWidget(const SouthseaCinemaApp());
    expect(find.text('Southsea Cinema'), findsOneWidget);
  });

  group('App smoke tests', () {
    testWidgets(
      'App loads and displays home screen',
      (WidgetTester tester) async {
        await tester.pumpWidget(const SouthseaCinemaApp());

        expect(find.text('Southsea Cinema'), findsOneWidget);
      },
    );

    testWidgets('Display movie cards', (WidgetTester tester) async {
      await tester.pumpWidget(const SouthseaCinemaApp());

      expect(find.text('Spirited Away'), findsOneWidget);
      expect(find.text('Akira'), findsOneWidget);
    });

    testWidgets('Show booking buttons', (WidgetTester tester) async {
      await tester.pumpWidget(const SouthseaCinemaApp());

      expect(find.text('Book Now'), findsNWidgets(2));
    });

    testWidgets('tapping order navigates to MovieListing with selected movie', (WidgetTester tester) async {
      await tester.pumpWidget(const SouthseaCinemaApp());

      // Tap the first "Book Now" button
      await tester.tap(find.text('Book Now').first);
      await tester.pumpAndSettle();

      // Verify that we navigated to the MovieListing screen
      expect(find.text('Spirited Away'), findsOneWidget);
    });

    testWidgets('Full booking flow', (WidgetTester tester) async {
      await tester.pumpWidget(const SouthseaCinemaApp());

      // Tap the first "Book Now" button
      await tester.tap(find.text('Book Now').first);
      await tester.pumpAndSettle();

      // Verify that we navigated to the MovieListing screen
      expect(find.text('Spirited Away'), findsOneWidget);

      // Select a quantity of tickets
      await tester.tap(find.text('Add to Order'));
      await tester.pump();

      // Verify that the booking confirmation message is displayed
      expect(find.textContaining('You have added'), findsOneWidget);
    });
  });
}
