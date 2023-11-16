import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../models/models.dart';
import '../services/services.dart';

class ProductScreen extends StatefulWidget {
  ProductScreen({super.key, ProductModel? dataReceived}) {
    reg = dataReceived ?? ProductModel(name: '', precio: 0);
  }
  ProductModel? reg;
  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  TextEditingController _name = TextEditingController();
  TextEditingController _precio = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final productoService = Provider.of<ProductService>(context);
    bool isNew = true;
    if (widget.reg!.id != null && widget.reg!.id! > 0) {
      isNew = false;
      _name.text = widget.reg!.name;
      _precio.text = widget.reg!.precio.toString();
    }
    return Scaffold(
      appBar: AppBar(
        title: isNew
            ? const Text('Crear Producto')
            : Text('Editar Producto ${widget.reg!.id}'),
      ),
      body: Center(
          child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            TextField(
              controller: _name,
              decoration: const InputDecoration(labelText: 'Nombre:'),
            ),
            TextField(
                controller: _precio,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Precio:')),
            const Gap(15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () async {
                    asignarProducto();
                    if (isNew) {
                      await productoService.create(widget.reg!);
                    } else {
                      await productoService.update(widget.reg!);
                    }
                    productoService.isEdit = false;
                    // ignore: use_build_context_synchronously
                    Navigator.pop(context);
                  },
                  child: const Text('Guardar'),
                ),
                const Gap(15),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Cerrar'),
                )
              ],
            )
          ],
        ),
      )),
    );
  }

  asignarProducto() {
    ProductModel product =
        ProductModel(name: _name.text, precio: double.parse(_precio.text));

    widget.reg ??= product;
    widget.reg!.name = _name.text;
    widget.reg!.precio = double.parse(_precio.text);
  }
}
