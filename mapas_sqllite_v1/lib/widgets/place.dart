import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/models.dart';
import '../screens/screens.dart';
import '../services/services.dart';

class PlaceWidget extends StatelessWidget {
  final PlaceModel place;

  const PlaceWidget({super.key, required this.place});

  @override
  Widget build(BuildContext context) {
    final placeService = Provider.of<PlaceService>(context);

    return ListTile(
        title: place.description.isNotEmpty
            ? Text(place.description)
            : const Text('Sin descripción'),
        leading: GestureDetector(
            onTap: () {
              placeService.delete(place.id!);
            },
            child: const Icon(Icons.delete, color: Colors.red)),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: () {
          placeService.isEdit = true;
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return PlaceScreen(
              place: place,
            );
          }));
        });
  }
}
