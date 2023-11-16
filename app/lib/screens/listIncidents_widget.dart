import 'package:flutter/material.dart';

class ListIncidents extends StatelessWidget {
  const ListIncidents({super.key});
  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> listIncidents = [
      {'caption': 'Incidencia No. 1', 'status': 'Pendiente', 'id': 1},
      {'caption': 'Incidencia No. 2', 'status': 'Asignado', 'id': 2},
      {'caption': 'Incidencia No. 3', 'status': 'En Proceso', 'id': 3},
      {'caption': 'Incidencia No. 4', 'status': 'Finalizado', 'id': 4}
    ];
    return Scaffold(
        appBar: AppBar(title: const Text("Incidencias Pendientes")),
        body: ListView.builder(
          itemBuilder: (context, idx) {
            String id = listIncidents[idx]["id"].toString();
            return ListTile(
                title: Text(listIncidents[idx]["caption"]),
                subtitle: Text('Estado: ' + listIncidents[idx]["status"]),
                leading: CircleAvatar(
                  child: Text(id),
                ),
                trailing: const Icon(Icons.arrow_right),
                onTap: () {});
          },
          itemCount: listIncidents.length,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Colors.green,
          child: const Icon(Icons.add),
        ));
  }
}
