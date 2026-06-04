import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/product.dart';
import 'package:flutter_application_1/usuario.dart';
import 'package:go_router/go_router.dart';

class AppScreen extends StatefulWidget {
  final Usuario usuario;

  const AppScreen({
    super.key,
    required this.usuario,
  });

  @override
  State<AppScreen> createState() => _AppScreenState();
}

class _AppScreenState extends State<AppScreen> {
  final TextEditingController nombreController = TextEditingController();
  final TextEditingController descripcionController = TextEditingController();
  final TextEditingController precioController = TextEditingController();
  final TextEditingController cantidadController = TextEditingController();

  Product? primerProducto;
  int productosCargados = 0;

  void cargarProducto() {
    if (nombreController.text.isEmpty ||
        descripcionController.text.isEmpty ||
        precioController.text.isEmpty ||
        cantidadController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Completá todos los campos')),
      );
      return;
    }

    final double? precio = double.tryParse(precioController.text);
    final int? cantidad = int.tryParse(cantidadController.text);

    if (precio == null || cantidad == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Precio o cantidad inválidos')),
      );
      return;
    }

    final nuevoProducto = Product(
      nombre: nombreController.text,
      descripcion: descripcionController.text,
      precio: precio,
      cantidad: cantidad,
      siguiente: primerProducto,
    );

    primerProducto = nuevoProducto;
    productosCargados++;

    nombreController.clear();
    descripcionController.clear();
    precioController.clear();
    cantidadController.clear();

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Producto cargado correctamente')),
    );
  }

  void calcularResultados() {
    if (primerProducto == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Debe haber al menos un producto cargado')),
      );
      return;
    }

    context.go('/results', extra: primerProducto);
  }

  @override
  void dispose() {
    nombreController.dispose();
    descripcionController.dispose();
    precioController.dispose();
    cantidadController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bienvenido ${widget.usuario.nombre}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            TextField(
              controller: nombreController,
              decoration: const InputDecoration(
                labelText: 'Nombre',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: descripcionController,
              decoration: const InputDecoration(
                labelText: 'Descripción',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: precioController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Precio',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: cantidadController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Cantidad',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: cargarProducto,
              child: const Text('Ingresar producto'),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: calcularResultados,
              child: const Text('Calcular'),
            ),
          ],
        ),
      ),
    );
  }
}
