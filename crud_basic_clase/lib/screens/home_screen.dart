import 'package:crud_basic_clase/screens/screens.dart';
import 'package:crud_basic_clase/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../models/models.dart';
import '../services/services.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: const _bodyScreen(),
        bottomNavigationBar: const BottomNavigationBarCustom(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            String barcodeScanRes;
            // Platform messages may fail, so we use a try/catch PlatformException.
            try {
              barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
                  '#ff6666', 'Cancel', true, ScanMode.QR);
              Uri url = Uri.parse(barcodeScanRes);
              if (await canLaunchUrl(url)) {
                await launchUrl(url);
              } else {
                print('no se puede abrir');
              }
            } on PlatformException {
              barcodeScanRes = 'Failed to get platform version.';
            }
            print('---------------------------------------------------');
            print(barcodeScanRes);
          },
          child: const Icon(Icons.camera),
        ));
  }
}

class _bodyScreen extends StatelessWidget {
  const _bodyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final uiService = Provider.of<UIChangeService>(context);
    final currentIndex = uiService.selectedMenuOpt;

    switch (currentIndex) {
      case 0:
        return const ApiScreen();
      case 1:
        return const LocalScreen();
      default:
        return const Center(
          child: Text('No existe la pantalla'),
        );
    }
  }
}
