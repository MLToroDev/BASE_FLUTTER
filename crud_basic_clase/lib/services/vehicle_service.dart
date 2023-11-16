import 'dart:convert';

import 'package:crud_basic_clase/models/models.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../shared/utils/utils.dart';

class VehicleService extends ChangeNotifier {
  List<VehicleModel> vehicles = [];
  bool isLoading = true;

  VehicleService() {
    load();
  }

  Future<List<VehicleModel>> load({bool isUsedLoading = true}) async {
    if (isUsedLoading) {
      isLoading = true;
      notifyListeners();
    }
    final url = Uri.https(Constants.baseUrl, 'Vehicles.json');

    final response = await http.get(url);
    vehicles.clear();
    if (response.body != "null") {
      final Map<String, dynamic> vehicleMap = json.decode(response.body);
      vehicleMap.forEach((key, value) {
        final vehicleTemp = VehicleModel.fromJson(value);
        vehicleTemp.id = key;
        vehicles.add(vehicleTemp);
      });
    }
    if (isUsedLoading) isLoading = false;
    notifyListeners();

    return vehicles;
  }

  Future<void> post(VehicleModel vehicle) async {
    final url = Uri.https(Constants.baseUrl, 'Vehicles.json');

    String data = jsonEncode(vehicle);
    final response = await http.post(url, body: data);
    load();
  }

  Future<void> put(VehicleModel vehicle) async {
    final url = Uri.https(Constants.baseUrl, 'Vehicles/${vehicle.id}.json');

    String data = jsonEncode(vehicle);
    final response = await http.put(url, body: data);
    load();
  }

  Future<void> delete(VehicleModel vehicle) async {
    final url = Uri.https(Constants.baseUrl, 'Vehicles/${vehicle.id}.json');

    String data = jsonEncode(vehicle);
    final response = await http.delete(url, body: data);
    load();
  }
}
