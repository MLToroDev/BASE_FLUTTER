import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'screens/screens.dart';
import 'services/services.dart';

void main() {
  runApp(const AppState());
}

class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => VehicleService(), lazy: true),
      ChangeNotifierProvider(
        create: (_) => UIChangeService(),
        lazy: true,
      ),
      ChangeNotifierProvider(create: (_) => ProductService(), lazy: true),
    ], child: const MyApp());
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'CRUD Basic',
        initialRoute: 'home',
        routes: {
          'home': (context) => const HomeScreen(),
          'local': (context) => const LocalScreen(),
          'api': (context) => const ApiScreen(),
          'vehicle': (context) => VehicleScreen(),
          'product': (context) => ProductScreen()
        },
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          useMaterial3: false,
        ));
  }
}
