import 'package:crud_basic_clase/models/models.dart';
import 'package:flutter/material.dart';

import 'services.dart';

class ProductService extends ChangeNotifier {
  List<ProductModel> products = [];
  bool _isEdit = false;

  bool get isEdit => _isEdit;
  set isEdit(bool value) {
    _isEdit = value;
    notifyListeners();
  }

  getAllProducts() async {
    final products = await SQLiteService.db.getAllProducts();
    this.products = [...products];
    print('cargar');
    if (!isEdit) {
      notifyListeners();
    }
  }

  delete(int id) async {
    final int res = await SQLiteService.db.deleteProduct(id);
    if (res > 0) {
      getAllProducts();
    }
  }

  create(ProductModel product) async {
    final int res = await SQLiteService.db.insertProduct(product);
    product.id = res;
    return product;
  }

  update(ProductModel product) async {
    await SQLiteService.db.updateProduct(product);
    return product;
  }
}
