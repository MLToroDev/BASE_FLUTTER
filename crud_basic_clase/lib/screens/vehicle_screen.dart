import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/models.dart';
import '../services/services.dart';

class VehicleScreen extends StatefulWidget {
  VehicleScreen({super.key, VehicleModel? dataReceived}) {
    reg = dataReceived;
  }
  VehicleModel? reg;
  @override
  State<VehicleScreen> createState() => _VehicleScreenState();
}

class _VehicleScreenState extends State<VehicleScreen> {
  TextEditingController _color = TextEditingController();
  TextEditingController _modelo = TextEditingController();
  TextEditingController _placa = TextEditingController();
  TextEditingController _tipoVehiculo = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final vehicleService = Provider.of<VehicleService>(context);
    bool isNew = true;
    if (widget.reg != null) {
      isNew = false;
      _color.text = widget.reg!.color;
      _modelo.text = widget.reg!.modelo.toString();
      _placa.text = widget.reg!.placa;
      _tipoVehiculo.text = widget.reg!.tipoVehiculo;
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Crear Vehículo'),
      ),
      body: Center(
          child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            TextField(
              controller: _color,
              decoration: const InputDecoration(labelText: 'Color:'),
            ),
            TextField(
                controller: _modelo,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Modelo:')),
            TextField(
                controller: _placa,
                decoration: const InputDecoration(labelText: 'Placa:')),
            TextField(
                controller: _tipoVehiculo,
                decoration:
                    const InputDecoration(labelText: 'Tipo de Vehículo:')),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () async {
                    asignarVehiculo();
                    if (isNew)
                      await vehicleService.post(widget.reg!);
                    else
                      await vehicleService.put(widget.reg!);
                    Navigator.pop(context);
                  },
                  child: const Text('Guardar'),
                ),
                const SizedBox(
                  width: 15,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Cerrar'),
                )
              ],
            )
          ],
        ),
      )),
    );
  }

  asignarVehiculo() {
    VehicleModel vehicle = VehicleModel(
        color: _color.text,
        modelo: int.parse(_modelo.text),
        placa: _placa.text,
        tipoVehiculo: _tipoVehiculo.text);

    widget.reg ??= vehicle;
    widget.reg!.color = _color.text;
    widget.reg!.modelo = int.parse(_modelo.text);
    widget.reg!.placa = _placa.text;
    widget.reg!.tipoVehiculo = _tipoVehiculo.text;
  }
}
