import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/models.dart';
import '../screens/screens.dart';
import '../services/services.dart';

class ListTitleProducts extends StatelessWidget {
  const ListTitleProducts({super.key, required this.product});

  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    final productService = Provider.of<ProductService>(context);

    return ListTile(
      leading: GestureDetector(
          onTap: () {
            productService.delete(product.id!);
          },
          child: const Icon(Icons.delete, color: Colors.red)),
      trailing: GestureDetector(
          onTap: () {
            productService.isEdit = true;
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ProductScreen(dataReceived: product),
              ),
            );
          },
          child: const Icon(Icons.arrow_forward_ios)),
      title: Row(
        children: [
          const Text('Producto: ',
              style: TextStyle(fontWeight: FontWeight.bold)),
          Text(product.name),
        ],
      ),
      subtitle: Column(
        children: [
          Row(
            children: [
              const Text(
                'Precio: ',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(product.precio.toString()),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            children: [
              const Text(
                'Id: ',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(product.id.toString()),
            ],
          ),
        ],
      ),
    );
  }
}
