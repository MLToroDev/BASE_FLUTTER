import 'dart:convert';

import 'package:crud_basic_firebase/models/models.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ProductService extends ChangeNotifier {
  final _baseUrl = 'testconstruccionv-default-rtdb.firebaseio.com';
  final List<ProductModel> products = [];
  bool isLoading = true;

  ProductService() {
    loadProducts();
  }

  Future<List<ProductModel>> loadProducts() async {
    isLoading = true;
    notifyListeners();

    final url = Uri.https(_baseUrl, 'products.json');

    final response = await http.get(url);

    final Map<String, dynamic> productMap = json.decode(response.body);

    productMap.forEach((key, value) {
      final tempProduct = ProductModel.fromJson(value);
      tempProduct.id = key;
      products.add(tempProduct);
    });

    isLoading = false;
    notifyListeners();

    return products;
  }
}
