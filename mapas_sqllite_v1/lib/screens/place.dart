import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

import '../models/models.dart';
import '../services/services.dart';

// ignore: must_be_immutable
class PlaceScreen extends StatefulWidget {
  PlaceModel? reg;
  PlaceScreen({super.key, PlaceModel? place}) {
    reg = place;
  }

  @override
  State<PlaceScreen> createState() => _PlaceScreenState();
}

class _PlaceScreenState extends State<PlaceScreen> {
  TextEditingController descriptionController = TextEditingController();
  String location = '';

  @override
  Widget build(BuildContext context) {
    final placeService = Provider.of<PlaceService>(context);
    bool isNew = widget.reg == null;

    if (!isNew) {
      descriptionController.text = widget.reg!.description;
    }

    return Scaffold(
      appBar: AppBar(
          title: isNew
              ? const Text('CRUD Lugar - Nuevo')
              : const Text('CRUD Lugar - Editar')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            children: [
              TextField(
                controller: descriptionController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Descripción',
                ),
              ),
              const Gap(5),
              ElevatedButton(
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.green),
                  onPressed: () {
                    Navigator.pushNamed(context, 'mapa', arguments:  widget.reg?.location ).then((value) {
                      if (value != null) {
                        setState(() {
                          location = extraerCoordenadas( value.toString());
                          
                         
                        });
                      }
                    });
                    print(location);
                  },
                  child: const Row(
                    children: [
                      Icon(Icons.map),
                      Gap(5),
                      Text('Ver / Elegir Mapa')
                    ],
                  )),
              const Gap(5),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                ElevatedButton(
                  onPressed: () async {
                    asignarPlace();
                    if (isNew) {
                      await placeService.create(widget.reg!);
                    } else {
                      await placeService.update(widget.reg!);
                    }
                    placeService.isEdit = false;
                    // ignore: use_build_context_synchronously
                    Navigator.pop(context);
                  },
                  child: const Text('Guardar'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Salir'),
                ),
              ]),
            ],
          ),
        ),
      ),
    );
  }
String extraerCoordenadas(String texto) {
  RegExp regex = RegExp(r"(-?\d+\.\d+)");
  Iterable<Match> matches = regex.allMatches(texto);

  List<String> numeros = [];
  for (Match match in matches) {
    numeros.add(match.group(0)!);
  }

  if (numeros.length >= 2) {
    return "${numeros[0]}, ${numeros[1]}";
  } else {
    // Manejo de caso donde no se encuentran suficientes números
    return "";
  }
}

  void asignarPlace() {
    PlaceModel place = PlaceModel(
      description: descriptionController.text,
      location: widget.reg == null ? '' : widget.reg!.location,
    );

    widget.reg ??= place;
    widget.reg!.description = descriptionController.text;
    widget.reg!.location = location;
  }
}
