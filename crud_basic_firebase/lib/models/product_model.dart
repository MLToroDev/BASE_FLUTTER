import 'dart:convert';

class ProductModel {
  String code;
  bool isActive;
  String name;
  int value;
  String? id;

  ProductModel({
    required this.code,
    required this.isActive,
    required this.name,
    required this.value,
  });

  factory ProductModel.fromRawJson(String str) =>
      ProductModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        code: json["code"],
        isActive: json["isActive"],
        name: json["name"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "isActive": isActive,
        "name": name,
        "value": value,
      };
}
