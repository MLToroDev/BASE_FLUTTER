import 'package:app/AppRoute/approute.dart';
import 'package:app/screens/screens.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        initialRoute: AppRoute.initialRoute,
        routes: AppRoute.getAppRoutes(),
        onGenerateRoute: AppRoute.onGenerateRoute,
        theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.orange));
  }
}
