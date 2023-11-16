import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
class MapaScreen extends StatefulWidget {
  final LatLng? location;

  MapaScreen({Key? key, this.location}) : super(key: key);

  @override
  State<MapaScreen> createState() => _MapaScreenState();
}

class _MapaScreenState extends State<MapaScreen> {
  Completer<GoogleMapController> _controller = Completer();
  late LatLng positionActual;

 @override
@override
void didChangeDependencies() {
  super.didChangeDependencies();

  // Obtener los argumentos
  var arguments = ModalRoute.of(context)!.settings.arguments;

  // Verificar si los argumentos no son nulos y son de tipo String
  if (arguments != null && arguments is String) {
    setState(() {
      positionActual = parseToLatLng(arguments.toString());
    });
  } else {
    // Si los argumentos son nulos o no son de tipo String, usar una ubicación predeterminada
    setState(() {
      positionActual = const LatLng(6.150599, -75.637073);
    });
  }
}

LatLng parseToLatLng(String coordenadas) {
  List<String> partes = coordenadas.split(',');

  if (partes.length != 2) {
    throw FormatException('El formato de coordenadas es incorrecto');
    // Aquí puedes manejar el error de alguna manera que tenga sentido para tu aplicación
    // Por ejemplo, podrías devolver un valor por defecto o lanzar una excepción
  }
print(partes[0]);
  double latitud = double.parse(partes[0]);
  double longitud = double.parse(partes[1]);

  return LatLng(latitud, longitud);
}

  @override
  Widget build(BuildContext context) {
    CameraPosition puntoInicial = CameraPosition(
      target: positionActual,
      zoom: 17,
    );

    return Scaffold(
      appBar: AppBar(title: const Text('Mapa')),
      body: GoogleMap(
        mapType: MapType.normal,
        markers: {
          Marker(
            markerId: const MarkerId('puntoActual'),
            position: positionActual,
          ),
        },
        initialCameraPosition: puntoInicial,
        onTap: (LatLng point) {
          setState(() {
            positionActual = point;
          });
        },
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context, positionActual);
        },
        backgroundColor: Colors.blue,
        child: const Icon(Icons.select_all),
      ),
    );
  }
}
