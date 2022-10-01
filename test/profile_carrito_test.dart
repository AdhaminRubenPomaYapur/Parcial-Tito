import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:parcial_flutter_testing/routes/app_routes.dart';

void main() {
  group('validacion perfil', () {
    testWidgets('muestra el nombre introducido ', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          initialRoute: 'profile',
          routes: AppRoute.getRoutes(),
        ),
      );
      Finder title = find.textContaining('Lionel Messi The best Player');
      expect(title, findsOneWidget);
    });

    testWidgets('muestra el nombre introducido ', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          initialRoute: 'profile',
          routes: AppRoute.getRoutes(),
        ),
      );
      Finder title = find.textContaining('Lionel Messi 10');
      expect(title, findsOneWidget);
    });

    testWidgets('idbutton', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        initialRoute: 'profile',
        routes: AppRoute.getRoutes(),
      ));
      Finder buttonID = find.byKey(const ValueKey('id_materialButtom'));

      Finder materialbutton = find.byType(MaterialButton);
      await tester.tap(materialbutton);
      expect(materialbutton, findsOneWidget);
    });

    testWidgets('ver boton comprar', (WidgetTester tester) async {
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
