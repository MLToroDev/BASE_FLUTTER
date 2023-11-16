import 'dart:convert';

PlaceModel placeModelFromJson(String str) =>
    PlaceModel.fromJson(json.decode(str));

String placeModelToJson(PlaceModel data) => json.encode(data.toJson());

class PlaceModel {
  int? id;
  String description;
  String location;

  PlaceModel({
    this.id,
    required this.description,
    required this.location,
  });

  factory PlaceModel.fromJson(Map<String, dynamic> json) => PlaceModel(
        id: json["id"],
        description: json["description"],
        location: json["location"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "description": description,
        "location": location,
      };
}
