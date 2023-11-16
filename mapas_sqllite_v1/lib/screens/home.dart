import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/models.dart';
import '../services/services.dart';
import '../widgets/widgets.dart';
import '../screens/screens.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final placeService = Provider.of<PlaceService>(context);
    placeService.getAllPlaces();
    List<PlaceModel> places = placeService.places;

    return Scaffold(
        appBar: AppBar(title: const Text('Mis lugares interesantes')),
        body: ListView.builder(
          itemCount: places.length,
          itemBuilder: (BuildContext context, int index) {
            return PlaceWidget(place: places[index]);
          },
        ),
        floatingActionButton: FloatingActionButton(
          heroTag: 'nuevo',
          onPressed: () {
            placeService.isEdit = true;
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return PlaceScreen();
            }));
          },
          child: const Icon(Icons.add),
        ));
  }
}
