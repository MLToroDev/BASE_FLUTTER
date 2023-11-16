import 'package:crud_basic_clase/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/models.dart';
import '../services/services.dart';
import '../widgets/widgets.dart';

class ApiScreen extends StatelessWidget {
  const ApiScreen({super.key});

  Future<void> onRefresh(VehicleService service) async {
    await service.load(isUsedLoading: false);
  }

  @override
  Widget build(BuildContext context) {
    final vehicleService = Provider.of<VehicleService>(context);

    if (vehicleService.isLoading) return const LoadingScreen();

    List<VehicleModel> listVehicles = vehicleService.vehicles;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Api Service'),
      ),
      body: RefreshIndicator(
        onRefresh: () => onRefresh(vehicleService),
        child: ListView.builder(
            itemCount: listVehicles.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTileVehicule(vehicle: listVehicles[index]);
            }),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, 'vehicle');
          },
          child: const Icon(
            Icons.add,
            size: 40,
            color: Colors.red,
          )),
    );
  }
}
