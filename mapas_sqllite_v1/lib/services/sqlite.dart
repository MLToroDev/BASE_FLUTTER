import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../models/models.dart';

class SQLiteService {
  static Database? _database;

  // Singleton: Única instancia de la clase
  static final SQLiteService db = SQLiteService._();

  SQLiteService._();

  Future<Database?> get database async {
    if (_database != null) return _database;

    _database = await _initDB();

    return _database;
  }

  Future<Database> _initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, 'claseSQLite.db');

    return await openDatabase(
      path,
      version: 6,
      onOpen: (db) {},
      onCreate: (Database db, int version) async {
        await db.execute('''
          CREATE TABLE places (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            description TEXT,
            location TEXT
          )
        ''');
      },
    );
  }

  // Insertar registros

  Future<int> insertPlace(PlaceModel place) async {
    final db = await database;

    final res = await db!.insert('places', place.toJson());

    return res;
  }

  // Actualizar registros
  Future<int> updatePlace(PlaceModel place) async {
    final db = await database;

    final res = await db!.update(
      'places',
      place.toJson(),
      where: 'id = ?',
      whereArgs: [place.id],
    );

    return res;
  }

  // Borrar un registro
  Future<int> deletePlace(int id) async {
    final db = await database;

    final res = await db!.delete(
      'places',
      where: 'id = ?',
      whereArgs: [id],
    );

    return res;
  }

  // Consultar todos los registros
  Future<List<PlaceModel>> getAllPlaces() async {
    final db = await database;

    final res = await db!.query('places');

    List<PlaceModel> list =
        res.isNotEmpty ? res.map((e) => PlaceModel.fromJson(e)).toList() : [];

    return list;
  }

  // Consultar un registro
  Future<PlaceModel?> getPlaceById(int id) async {
    final db = await database;

    final res = await db!.query(
      'places',
      where: 'id = ?',
      whereArgs: [id],
    );

    return res.isNotEmpty ? PlaceModel.fromJson(res.first) : null;
  }
}
