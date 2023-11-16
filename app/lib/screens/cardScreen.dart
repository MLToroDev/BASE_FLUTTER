import 'package:flutter/material.dart';

class CardScreen extends StatelessWidget {
  const CardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Card'),
        ),
        body: ListView(
          children: const [
            Card(
              child: Column(
                children: [
                  ListTile(
                      leading: Icon(Icons.abc_rounded),
                      title: Text("Titulo"),
                      subtitle: Text("Subtitulo"))
                ],
              ),
            ),
            Card(
              child: Column(
                children: [
                  ListTile(
                      leading: Icon(Icons.abc_rounded),
                      title: Text("Titulo"),
                      subtitle: Text("Subtitulo"))
                ],
              ),
            )
          ],
        ));
  }
}
