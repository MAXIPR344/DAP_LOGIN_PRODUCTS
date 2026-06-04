import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/product.dart';

class ResultsScreen extends StatelessWidget {
  final Product primerProducto;

  const ResultsScreen({
    super.key,
    required this.primerProducto,
  });

  @override
  Widget build(BuildContext context) {
    Product? actual = primerProducto;

    Product productoMasCaro = primerProducto;
    Product productoMasBarato = primerProducto;
    Product productoMayorCantidad = primerProducto;
    Product productoMenorCantidad = primerProducto;

    double sumaPrecios = 0;
    int contador = 0;

    while (actual != null) {
      sumaPrecios += actual.precio;
      contador++;

      if (actual.precio > productoMasCaro.precio) {
        productoMasCaro = actual;
      }

      if (actual.precio < productoMasBarato.precio) {
        productoMasBarato = actual;
      }

      if (actual.cantidad > productoMayorCantidad.cantidad) {
        productoMayorCantidad = actual;
      }

      if (actual.cantidad < productoMenorCantidad.cantidad) {
        productoMenorCantidad = actual;
      }

      actual = actual.siguiente;
    }

    final precioPromedio = sumaPrecios / contador;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Resultados'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: ListView(
          children: [
            _card('Producto más caro', productoMasCaro),
            _card('Producto más barato', productoMasBarato),
            _card('Mayor cantidad', productoMayorCantidad),
            _card('Menor cantidad', productoMenorCantidad),
            const SizedBox(height: 16),
            Text(
              'Precio promedio: ${precioPromedio.toStringAsFixed(2)}',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  Widget _card(String titulo, Product producto) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(titulo,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                )),
            const SizedBox(height: 8),
            Text('Nombre: ${producto.nombre}'),
            Text('Descripción: ${producto.descripcion}'),
            Text('Precio: ${producto.precio}'),
            Text('Cantidad: ${producto.cantidad}'),
          ],
        ),
      ),
    );
  }
}
