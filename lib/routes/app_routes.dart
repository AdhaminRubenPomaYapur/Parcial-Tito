import 'package:flutter/material.dart';
import 'package:parcial_flutter_testing/models/menu_option.dart';
import 'package:parcial_flutter_testing/screens/screens.dart';

class AppRoute {

  static final menuOptions = <MenuOption>[
    MenuOption(route: 'login',            screen: const LoginScreen()),
    MenuOption(route: 'dailyProgress',    screen: const DailyProgressScreen()),
    MenuOption(route: 'profile',          screen: const ProfileScreen()),
    MenuOption(route: 'carrito',          screen: const CarritoCompras()),
  ];

  static Map<String, Widget Function(BuildContext)> getRoutes() {
    Map<String, Widget Function(BuildContext)> routes = {};
    for (final option in menuOptions) {
      routes.addAll({option.route: (BuildContext context) => option.screen});
    }
    return routes;
  }
}