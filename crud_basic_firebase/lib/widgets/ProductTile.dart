import 'package:flutter/material.dart';
import '../models/models.dart';

class ProductTile extends StatelessWidget {
  final ProductModel product;

  const ProductTile({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Text(
          product.name,
          style: const TextStyle(
              fontSize: 24, fontWeight: FontWeight.bold, color: Colors.indigo),
        ),
        subtitle: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const Text('Código: ',
                    style:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                const SizedBox(
                  width: 5,
                ),
                Text(product.code, style: const TextStyle(fontSize: 14)),
              ],
            ),
            Text(
              product.id!,
              style: const TextStyle(fontSize: 10),
            )
          ],
        ));
  }
}
