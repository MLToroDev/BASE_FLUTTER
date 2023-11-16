import 'package:crud_basic_clase/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../models/models.dart';
import '../services/services.dart';

class ListTileVehicule extends StatelessWidget {
  const ListTileVehicule({super.key, required this.vehicle});

  final VehicleModel vehicle;
  @override
  Widget build(BuildContext context) {
    final vehicleService = Provider.of<VehicleService>(context);

    return ListTile(
      leading: GestureDetector(
          onTap: () {
            vehicleService.delete(vehicle);
          },
          child: const Icon(Icons.delete, color: Colors.red)),
      trailing: GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => VehicleScreen(dataReceived: vehicle),
              ),
            );
          },
          child: const Icon(Icons.arrow_forward_ios)),
      title: Row(
        children: [
          const Text('Placa: ', style: TextStyle(fontWeight: FontWeight.bold)),
          Text(vehicle.placa),
        ],
      ),
      subtitle: Column(
        children: [
          Row(
            children: [
              const Text(
                'Modelo: ',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(vehicle.modelo.toString()),
            ],
          ),
          const Gap(5),
          Row(
            children: [
              const Text(
                'Tipo Vehículo: ',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(vehicle.tipoVehiculo),
            ],
          ),
          const Gap(5),
          Row(
            children: [
              const Text(
                'Color: ',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(vehicle.color),
            ],
          ),
        ],
      ),
    );
  }
}
