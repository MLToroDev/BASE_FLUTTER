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
    print('Ruta base de datos');
    print(path);

    return await openDatabase(
      path,
      version: 6,
      onOpen: (db) {},
      onCreate: (Database db, int version) async {
        await db.execute('''
          CREATE TABLE products (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT,
            precio DECIMAL(10,2)
          )
        ''');
      },
    );
  }

  // Insertar registros

  Future<int> insertProduct(ProductModel product) async {
    final db = await database;

    final res = await db!.insert('products', product.toJson());

    return res;
  }

  // Actualizar registros
  Future<int> updateProduct(ProductModel product) async {
    final db = await database;

    final res = await db!.update(
      'products',
      product.toJson(),
      where: 'id = ?',
      whereArgs: [product.id],
    );

    return res;
  }

  // Borrar un registro
  Future<int> deleteProduct(int id) async {
    final db = await database;

    final res = await db!.delete(
      'products',
      where: 'id = ?',
      whereArgs: [id],
    );

    return res;
  }

  // Consultar todos los registros
  Future<List<ProductModel>> getAllProducts() async {
    final db = await database;

    final res = await db!.query('products');

    List<ProductModel> list =
        res.isNotEmpty ? res.map((e) => ProductModel.fromJson(e)).toList() : [];

    return list;
  }

  // Consultar un registro
  Future<ProductModel?> getProductById(int id) async {
    final db = await database;

    final res = await db!.query(
      'products',
      where: 'id = ?',
      whereArgs: [id],
    );

    return res.isNotEmpty ? ProductModel.fromJson(res.first) : null;
  }
}
