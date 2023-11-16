import 'package:flutter/material.dart';

import '../models/models.dart';
import '../screens/screens.dart';

class AppRoute {
  static const String initialRoute = 'home';

  static final menuOptions = <MenuOptions>[
    MenuOptions(
        route: 'listIncidentes',
        icon: Icons.list,
        name: 'Incidentes',
        screen: const ListIncidents()),
    MenuOptions(
        route: 'cards',
        icon: Icons.credit_card,
        name: 'Cards',
        screen: const CardScreen()),
    MenuOptions(
        route: 'alert',
        icon: Icons.notification_add,
        name: 'Alerts',
        screen: const AlertScreen()),
  ];

  static Map<String, Widget Function(BuildContext)> getAppRoutes() {
    Map<String, Widget Function(BuildContext)> appRoutes = {};

    appRoutes.addAll({'home': (BuildContext context) => const HomeScreen()});

    for (final option in menuOptions) {
      appRoutes.addAll({option.route: (BuildContext context) => option.screen});
    }

    return appRoutes;
  }

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (context) => const HomeScreen(),
    );
  }
}
