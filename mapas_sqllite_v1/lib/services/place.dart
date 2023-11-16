import 'package:flutter/material.dart';

import '../models/place.dart';
import 'services.dart';

class PlaceService extends ChangeNotifier {
  List<PlaceModel> places = [];
  bool _isEdit = false;

  bool get isEdit => _isEdit;
  set isEdit(bool value) {
    _isEdit = value;
    notifyListeners();
  }

  getAllPlaces() async {
    final places = await SQLiteService.db.getAllPlaces();
    this.places = [...places];
    if (!isEdit) {
      notifyListeners();
    }
  }

  delete(int id) async {
    final int res = await SQLiteService.db.deletePlace(id);
    if (res > 0) {
      getAllPlaces();
    }
  }

  create(PlaceModel place) async {
    final int res = await SQLiteService.db.insertPlace(place);
    place.id = res;
    return place;
  }

  update(PlaceModel place) async {
    await SQLiteService.db.updatePlace(place);
    return place;
  }
}
