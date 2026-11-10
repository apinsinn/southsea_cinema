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
  });
}
