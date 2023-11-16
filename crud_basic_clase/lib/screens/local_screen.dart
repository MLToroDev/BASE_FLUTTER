import 'package:crud_basic_clase/screens/product_screen.dart';
import 'package:crud_basic_clase/services/services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/models.dart';
import '../widgets/widgets.dart';

class LocalScreen extends StatelessWidget {
  const LocalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final productService = Provider.of<ProductService>(context);
    productService.getAllProducts();
    List<ProductModel> productos = productService.products;

    return Scaffold(
        appBar: AppBar(
          title: const Text('Bases de local'),
        ),
        body: ListView.builder(
          itemCount: productos.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTitleProducts(product: productos[index]);
          },
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              productService.isEdit = true;
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ProductScreen(dataReceived: null),
                ),
              );
            },
            heroTag: 'localNuevo',
            child: const Icon(
              Icons.add,
              size: 40,
              color: Colors.red,
            )));
  }
}
