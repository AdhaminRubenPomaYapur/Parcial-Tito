import 'package:flutter/material.dart';
import 'package:parcial_flutter_testing/routes/app_routes.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  group("test perfil", () {
    IntegrationTestWidgetsFlutterBinding.ensureInitialized();

    testWidgets('should view profile screen', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        initialRoute: 'login',
        routes: AppRoute.getRoutes(),
      ));
      Finder emailTextField = find.byKey(const ValueKey('email_id'));
      Finder passwordTextField = find.byKey(const ValueKey('password_id'));

      await tester.enterText(emailTextField, 'adhamin055@gmail.com');
      await tester.enterText(passwordTextField, 'password123');

      Finder textButton = find.byType(TextButton);
      await tester.tap(textButton);
      await tester.pumpAndSettle(const Duration(seconds: 3));

      Finder materialbutton = find.byType(MaterialButton);
      expect(materialbutton, findsOneWidget);
    });

    testWidgets('ver switch', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        initialRoute: 'login',
        routes: AppRoute.getRoutes(),
      ));
      Finder emailTextField = find.byKey(const ValueKey('email_id'));
      Finder passwordTextField = find.byKey(const ValueKey('password_id'));

      await tester.enterText(emailTextField, 'adhamin055@gmail.com');
      await tester.enterText(passwordTextField, 'password123');

      Finder textButton = find.byType(TextButton);
      await tester.tap(textButton);
      await tester.pumpAndSettle(const Duration(seconds: 3));

      Finder materialbutton = find.byType(Switch);
      expect(materialbutton, findsOneWidget);
    });
  });
}
