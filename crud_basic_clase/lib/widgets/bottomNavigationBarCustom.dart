import 'package:crud_basic_clase/services/services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BottomNavigationBarCustom extends StatelessWidget {
  const BottomNavigationBarCustom({super.key});

  @override
  Widget build(BuildContext context) {
    final uiService = Provider.of<UIChangeService>(context);

    final currentIndex = uiService.selectedMenuOpt;

    return BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (int index) => uiService.selectedMenuOpt = index,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.filter_drama), label: 'API Crud'),
          BottomNavigationBarItem(icon: Icon(Icons.save), label: 'Local Crud'),
        ]);
  }
}
