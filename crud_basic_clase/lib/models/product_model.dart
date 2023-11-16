import 'dart:convert';

ProductModel productModelFromJson(String str) =>
    ProductModel.fromJson(json.decode(str));

String productModelToJson(ProductModel data) => json.encode(data.toJson());

class ProductModel {
  int? id;
  String name;
  double precio;

  ProductModel({
    this.id,
    required this.name,
    required this.precio,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json["id"],
        name: json["name"],
        precio: double.parse(json["precio"].toString()),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "precio": precio,
      };
}
