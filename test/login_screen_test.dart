
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:parcial_flutter_testing/routes/app_routes.dart';


void main() {
  group('validated startup', () {
    testWidgets('should show login especify title', (WidgetTester tester) async {
      await tester.pumpWidget(  
        MaterialApp(
          initialRoute: 'login',
          routes: AppRoute.getRoutes(),
        )
      );
      Finder title = find.text('Welcome to App');
      expect(title, findsOneWidget);
    });

    testWidgets('should has key for textFormFields on form', (WidgetTester tester) async {
      await tester.pumpWidget(  
        MaterialApp(
          initialRoute: 'login',
          routes: AppRoute.getRoutes(),
        )
      );
      Finder emailTextField    = find.byKey(const ValueKey('email_id'));
      Finder passwordTextField = find.byKey(const ValueKey('password_id'));

      expect(emailTextField,    findsOneWidget);
      expect(passwordTextField, findsOneWidget);
    });
  });

  testWidgets('should has a button login', (WidgetTester tester) async {
    await tester.pumpWidget(  
      MaterialApp(
        initialRoute: 'login',
        routes: AppRoute.getRoutes(),
      )
    );
    Finder textButton    = find.byType(TextButton);
    expect(textButton, findsOneWidget);
  });

  testWidgets('should message error if fields are empty or null', (WidgetTester tester) async {
    await tester.pumpWidget(  
      MaterialApp(
        initialRoute: 'login',
        routes: AppRoute.getRoutes(),
      )
    );
    Finder textButton    = find.byType(TextButton);
    await tester.tap(textButton);
    await tester.pumpAndSettle();

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
    Finder emailTextField    = find.byKey(const ValueKey('email_id'));
    Finder passwordTextField = find.byKey(const ValueKey('password_id'));

    await tester.enterText(emailTextField,    'adhamin055@gmail.com');
    await tester.enterText(passwordTextField, 'password123');

    Finder textButton    = find.byType(TextButton);
    await tester.tap(textButton);
    await tester.pumpAndSettle();

    Finder emailEmpty    = find.text('email null or empty');
    Finder passwordEmpty = find.text('password null or empty');

    expect(emailEmpty, findsNothing);
    expect(passwordEmpty, findsNothing);

    Finder textProfile = find.text('ProfileScreen');
    expect(textProfile, findsOneWidget);

  });
}