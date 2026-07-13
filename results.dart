import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/product.dart';

class ResultsScreen extends StatelessWidget {
  final Product producto;

  const ResultsScreen({
    super.key,
    required this.producto,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(producto.nombre),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              producto.imagen,
              width: double.infinity,
              height: 250,
              fit: BoxFit.cover,
            ),

            const SizedBox(height: 20),

            Text(
              producto.nombre,
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                producto.descripcion,
                style: const TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
