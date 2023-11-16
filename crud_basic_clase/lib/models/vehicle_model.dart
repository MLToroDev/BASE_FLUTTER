import 'dart:convert';

class VehicleModel {
  String color;
  int modelo;
  String placa;
  String tipoVehiculo;
  String? id;

  VehicleModel({
    required this.color,
    required this.modelo,
    required this.placa,
    required this.tipoVehiculo,
  });

  factory VehicleModel.fromRawJson(String str) =>
      VehicleModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory VehicleModel.fromJson(Map<String, dynamic> json) => VehicleModel(
        color: json["Color"],
        modelo: json["Modelo"],
        placa: json["Placa"],
        tipoVehiculo: json["TipoVehiculo"],
      );

  Map<String, dynamic> toJson() => {
        "Color": color,
        "Modelo": modelo,
        "Placa": placa,
        "TipoVehiculo": tipoVehiculo,
      };
}
