import 'package:crud_basic_firebase/models/product_model.dart';
import 'package:crud_basic_firebase/screens/screens.dart';
import 'package:crud_basic_firebase/services/product_services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final productService = Provider.of<ProductService>(context);
    if (productService.isLoading) return const LoadingScreen();

    return Scaffold(
      appBar: AppBar(title: const Text('CRUD Básico con Firebase')),
      body: ListView.builder(
          itemCount: productService.products.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
                onTap: () {},
                child: ProductTile(product: productService.products[index]));
          }),
      floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Colors.indigo,
          elevation: 0,
          child: const Icon(
            Icons.add,
            color: Colors.white,
            size: 40,
          )),
    );
  }
}
