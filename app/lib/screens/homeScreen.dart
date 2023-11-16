import 'package:flutter/material.dart';

import '../AppRoute/approute.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final listMenu = AppRoute.menuOptions;

    return Scaffold(
        appBar: AppBar(
          title: const Text('HomeScreen'),
        ),
        body: Center(
          child: ListView.separated(
              itemBuilder: (context, i) {
                return ListTile(
                  title: Text(listMenu[i].name),
                  leading: Icon(listMenu[i].icon),
                  trailing: const Icon(Icons.arrow_forward_rounded),
                  onTap: () {
                    Navigator.pushNamed(context, listMenu[i].route);
                  },
                );
              },
              separatorBuilder: (context, i) {
                return const Divider();
              },
              itemCount: listMenu.length),
        ));
  }
}
