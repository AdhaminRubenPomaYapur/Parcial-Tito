import 'package:flutter/material.dart';
import 'package:parcial_flutter_testing/routes/app_routes.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  group('Test login', () {
    IntegrationTestWidgetsFlutterBinding.ensureInitialized();
    testWidgets('should message error if fields are empty or null',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        initialRoute: 'login',
        routes: AppRoute.getRoutes(),
      ));
      Finder textButton = find.byType(TextButton);
      await tester.tap(textButton);
      await tester.pumpAndSettle(const Duration(seconds: 2));

      Finder emailEmpty = find.text('email null or empty');
      Finder passwordEmpty = find.text('password null or empty');

      expect(emailEmpty, findsOneWidget);
      expect(passwordEmpty, findsOneWidget);
    });
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
      await tester.pumpAndSettle(const Duration(seconds: 2));
    });

    testWidgets('should show profile screen if all correct', (WidgetTester tester) async {
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

      await tester.pumpAndSettle( const Duration( seconds: 3 ));

      Finder textProfile = find.text('Comprar');
      expect(textProfile, findsOneWidget);

    });

    testWidgets('should view carrito compras to does', (WidgetTester tester) async {
      await tester.pumpWidget(  
        MaterialApp(
          initialRoute: 'login',
          routes: AppRoute.getRoutes(),
        )
      );
      Finder emailTextField    = find.byKey(const ValueKey('email_id'));
      Finder passwordTextField = find.byKey(const ValueKey('password_id'));

      await tester.enterText(emailTextField, 'adhamin055@gmail.com');
      await tester.enterText(passwordTextField, 'password123');

      Finder textButton = find.byType(TextButton);
      await tester.tap(textButton);
<<<<<<< HEAD
      await tester.pumpAndSettle(const Duration(seconds: 3));

      Finder emailEmpty = find.text('email null or empty');
      Finder passwordEmpty = find.text('password null or empty');
=======
      await tester.pump( const Duration( seconds: 2 ));

      Finder buttonMaterial = find.byType(MaterialButton);
      await tester.tap(buttonMaterial);
      await tester.pump(const Duration( seconds: 3 ));
      
      Finder textCarrito = find.text('Carrito de Compras');
      expect(textCarrito, findsOneWidget);
>>>>>>> 67c2b595978d20b795106adc7e54eeb7ea8cdc30

    });

<<<<<<< HEAD
      Finder textProfile = find.text('Comprar');
      expect(textProfile, findsOneWidget);
=======
    testWidgets('should show to item list', (WidgetTester tester) async {
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
      await tester.pump( const Duration( seconds: 2 ));

      Finder buttonMaterial = find.byType(MaterialButton);
      await tester.tap(buttonMaterial);
      await tester.pump(const Duration( seconds: 3 ));
      
      Finder textCarrito = find.text('Huawei P40 Pro');
      expect(textCarrito, findsOneWidget);

    });

    testWidgets('should show to view message', (WidgetTester tester) async {
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
      await tester.pump( const Duration( seconds: 2 ));

      Finder buttonMaterial = find.byType(MaterialButton);
      await tester.tap(buttonMaterial);
      await tester.pump(const Duration( seconds: 3 ));
      
      Finder floatingActionButton = find.byType(FloatingActionButton);
      await tester.tap(floatingActionButton);
      await tester.pump(const Duration( seconds: 2 ));

      Finder textMessage = find.text('No hay data');
      expect(textMessage, findsOneWidget);

    });

    testWidgets('should show to create data', (WidgetTester tester) async {
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
      await tester.pump( const Duration( seconds: 2 ));

      Finder buttonMaterial = find.byType(MaterialButton);
      await tester.tap(buttonMaterial);
      await tester.pump(const Duration( seconds: 3 ));
      
      Finder iconButton = find.byKey(const ValueKey('adicionar_iconB'));
      await tester.tap(iconButton);
      await tester.pump(const Duration( seconds: 2 ));

      Finder textMessage = find.text('Adicionar producto');
      

      Finder productTextFormField = find.byKey(const ValueKey('product_id'));
      Finder priceTextFormField = find.byKey(const ValueKey('price_id'));
      Finder stockTextFormField = find.byKey(const ValueKey('stock_id'));

      expect(textMessage, findsOneWidget);
      expect(productTextFormField, findsOneWidget);
      expect(priceTextFormField, findsOneWidget);
      expect(stockTextFormField, findsOneWidget);

    });

    testWidgets('should show to create data and agree', (WidgetTester tester) async {
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
      await tester.pump( const Duration( seconds: 2 ));

      Finder buttonMaterial = find.byType(MaterialButton);
      await tester.tap(buttonMaterial);
      await tester.pump(const Duration( seconds: 3 ));
      
      Finder iconButton = find.byKey(const ValueKey('adicionar_iconB'));
      await tester.tap(iconButton);
      await tester.pump(const Duration( seconds: 2 ));      

      Finder productTextFormField = find.byKey(const ValueKey('product_id'));
      Finder priceTextFormField = find.byKey(const ValueKey('price_id'));
      Finder stockTextFormField = find.byKey(const ValueKey('stock_id'));

      await tester.enterText(productTextFormField, 'Iphone 8 plus');
      await tester.enterText(priceTextFormField,   '789.6');
      await tester.enterText(stockTextFormField,   '10');

      Finder agregarButton = find.text('Agregar');
      await tester.tap(agregarButton);
      await tester.pumpAndSettle( const Duration( seconds: 2 ));

      Finder productAgree = find.text('Iphone 8 plus');
      expect(productAgree, findsOneWidget);

    });

    testWidgets('should show to create data and view alert dialog', (WidgetTester tester) async {
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
      await tester.pump( const Duration( seconds: 2 ));

      Finder buttonMaterial = find.byType(MaterialButton);
      await tester.tap(buttonMaterial);
      await tester.pump(const Duration( seconds: 3 ));
      
      Finder iconButton = find.byKey(const ValueKey('adicionar_iconB'));
      await tester.tap(iconButton);
      await tester.pump(const Duration( seconds: 2 ));      

      Finder productTextFormField = find.byKey(const ValueKey('product_id'));
      Finder priceTextFormField = find.byKey(const ValueKey('price_id'));
      Finder stockTextFormField = find.byKey(const ValueKey('stock_id'));

      await tester.enterText(productTextFormField, 'Iphone 8 plus');
      await tester.enterText(priceTextFormField,   '789.6');
      await tester.enterText(stockTextFormField,   '10');

      Finder agregarButton = find.text('Agregar');
      await tester.tap(agregarButton);
      await tester.pump( const Duration( seconds: 2 ));

      Finder productAgree = find.text('Iphone 8 plus');
      await tester.tap(productAgree);
      await tester.pump( const Duration( seconds: 2 ));

      Finder updateandDeleteText = find.text('Update and Delete');
      expect(updateandDeleteText, findsOneWidget);

    });

    testWidgets('should to create data and update data', (WidgetTester tester) async {
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
      await tester.pump( const Duration( seconds: 2 ));

      Finder buttonMaterial = find.byType(MaterialButton);
      await tester.tap(buttonMaterial);
      await tester.pump(const Duration( seconds: 3 ));
      
      Finder iconButton = find.byKey(const ValueKey('adicionar_iconB'));
      await tester.tap(iconButton);
      await tester.pump(const Duration( seconds: 2 ));      

      Finder productTextFormField = find.byKey(const ValueKey('product_id'));
      Finder priceTextFormField = find.byKey(const ValueKey('price_id'));
      Finder stockTextFormField = find.byKey(const ValueKey('stock_id'));

      await tester.enterText(productTextFormField, 'Iphone 8 plus');
      await tester.enterText(priceTextFormField,   '789.6');
      await tester.enterText(stockTextFormField,   '10');

      Finder agregarButton = find.text('Agregar');
      await tester.tap(agregarButton);
      await tester.pump( const Duration( seconds: 2 ));

      Finder productAgree = find.text('Iphone 8 plus');
      await tester.tap(productAgree);
      await tester.pumpAndSettle( const Duration( seconds: 2 ));

      Finder productupdelTextFormField = find.byKey(const ValueKey('productupdated_id'));
      Finder priceupdelTextFormField   = find.byKey(const ValueKey('priceupdated_id'));
      Finder stockupdelTextFormField   = find.byKey(const ValueKey('stockupdated_id'));

      await tester.enterText(productupdelTextFormField, 'Iphone 5 plus');
      await tester.enterText(priceupdelTextFormField,   '1089.6');
      await tester.enterText(stockupdelTextFormField,   '30');

      Finder actualizarButton = find.text('Actualizar');
      await tester.tap(actualizarButton);
      await tester.pumpAndSettle( const Duration( seconds: 2 ));

      Finder productUpdated = find.text('Iphone 5 plus');
      expect(productUpdated, findsOneWidget);
    });

    testWidgets('should to create data and delete data', (WidgetTester tester) async {
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
      await tester.pump( const Duration( seconds: 2 ));

      Finder buttonMaterial = find.byType(MaterialButton);
      await tester.tap(buttonMaterial);
      await tester.pump(const Duration( seconds: 3 ));
      
      Finder iconButton = find.byKey(const ValueKey('adicionar_iconB'));
      await tester.tap(iconButton);
      await tester.pump(const Duration( seconds: 2 ));      

      Finder productTextFormField = find.byKey(const ValueKey('product_id'));
      Finder priceTextFormField = find.byKey(const ValueKey('price_id'));
      Finder stockTextFormField = find.byKey(const ValueKey('stock_id'));

      await tester.enterText(productTextFormField, 'Iphone 8 plus');
      await tester.enterText(priceTextFormField,   '789.6');
      await tester.enterText(stockTextFormField,   '10');

      Finder agregarButton = find.text('Agregar');
      await tester.tap(agregarButton);
      await tester.pump( const Duration( seconds: 2 ));

      Finder productAgree = find.text('Iphone 8 plus');
      await tester.tap(productAgree);
      await tester.pumpAndSettle( const Duration( seconds: 2 ));

      Finder eliminarButton = find.text('Eliminar');
      await tester.tap(eliminarButton);
      await tester.pumpAndSettle( const Duration( seconds: 2 ));

      expect(productAgree, findsNothing);

    });

    testWidgets('should view message not data car product', (WidgetTester tester) async {
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
      await tester.pump( const Duration( seconds: 2 ));

      Finder buttonMaterial = find.byType(MaterialButton);
      await tester.tap(buttonMaterial);
      await tester.pump(const Duration( seconds: 3 ));
      
      Finder floatingActionButton = find.byType(FloatingActionButton);
      await tester.tap(floatingActionButton);
      await tester.pump(const Duration( seconds: 3 ));

      Finder textMessage = find.text('No hay data');
      expect(textMessage, findsOneWidget);

    });

    testWidgets('should agree car product items', (WidgetTester tester) async {
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

      Finder textButton = find.byType(TextButton);
      await tester.tap(textButton);
      await tester.pump( const Duration( seconds: 2 ));

      Finder buttonMaterial = find.byType(MaterialButton);
      await tester.tap(buttonMaterial);
      await tester.pump(const Duration( seconds: 3 ));

      Finder redmi9 = find.text('Redmi 9 pro');

      await tester.tap(redmi9);
      await tester.pump( const Duration( seconds: 2 ));

      Finder agreeCar = find.text('Añadir');
      await tester.tap(agreeCar);
      await tester.pump( const Duration( seconds: 2 ));
      
      
      Finder floatingActionButton = find.byType(FloatingActionButton);
      await tester.tap(floatingActionButton);

      Finder productCar = find.text('Redmi 9 pro');
      expect(productCar, findsOneWidget);

      await tester.pumpAndSettle(const Duration( seconds: 3 ));
>>>>>>> 67c2b595978d20b795106adc7e54eeb7ea8cdc30
    });

    // testWidgets('should view profile screen', (WidgetTester tester) async {
    //   await tester.pumpWidget(MaterialApp(
    //     initialRoute: 'login',
    //     routes: AppRoute.getRoutes(),
    //   ));
    //   Finder emailTextField = find.byKey(const ValueKey('email_id'));
    //   Finder passwordTextField = find.byKey(const ValueKey('password_id'));

    //   await tester.enterText(emailTextField, 'adhamin055@gmail.com');
    //   await tester.enterText(passwordTextField, 'password123');

    //   Finder textButton = find.byType(TextButton);
    //   await tester.tap(textButton);
    //   await tester.pumpAndSettle(const Duration(seconds: 3));

    //   Finder materialbutton = find.byType(MaterialButton);
    //   expect(materialbutton, findsOneWidget);
    // });
  });
}
