import 'package:flutter/material.dart';
import 'package:parcial_flutter_testing/routes/app_routes.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  group('Test login', () {
    IntegrationTestWidgetsFlutterBinding.ensureInitialized();
    testWidgets('should message error if fields are empty or null', (WidgetTester tester) async {
      await tester.pumpWidget(  
        MaterialApp(
          initialRoute: 'login',
          routes: AppRoute.getRoutes(),
        )
      );
      Finder textButton    = find.byType(TextButton);
      await tester.tap(textButton);
      await tester.pumpAndSettle( const Duration( seconds: 2 ));

      Finder emailEmpty    = find.text('email null or empty');
      Finder passwordEmpty = find.text('password null or empty');

      expect(emailEmpty, findsOneWidget);
      expect(passwordEmpty, findsOneWidget);
    });
    testWidgets('should view profile screen', (WidgetTester tester) async {
      await tester.pumpWidget(  
        MaterialApp(
          initialRoute: 'login',
          routes: AppRoute.getRoutes(),
        )
      );
      Finder textButton    = find.byType(TextButton);
      await tester.tap(textButton);
      await tester.pumpAndSettle( const Duration( seconds: 2 ));

      Finder emailEmpty    = find.text('email null or empty');
      Finder passwordEmpty = find.text('password null or empty');

      await tester.pumpAndSettle( const Duration( seconds: 2 ));
      expect(emailEmpty, findsOneWidget);
      expect(passwordEmpty, findsOneWidget);
    });
  });
}