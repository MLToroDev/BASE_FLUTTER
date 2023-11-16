import 'package:flutter/material.dart';

class AlertScreen extends StatelessWidget {
  const AlertScreen({super.key});

  displayDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Mensaje de Alerta',
              style: TextStyle(color: Colors.red)),
          content: const Text(
              'aslkñfasdfoiqeroil dsflasdfjlkñasd dsaflñasfdjlkñasf'),
          actions: [
            TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Cancelar')),
            TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Ok')),
          ],
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusDirectional.circular(10)),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AlertScreen'),
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () => displayDialog(context),
            child: const Text('Mostrar')),
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.green,
          onPressed: () {
            return Navigator.pop(context);
          },
          child: const Icon(Icons.close)),
    );
  }
}
