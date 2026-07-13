import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/product.dart';
import 'package:flutter_application_1/usuario.dart';
import 'package:go_router/go_router.dart';

class AppScreen extends StatelessWidget {
  final Usuario usuario;

  const AppScreen({super.key, required this.usuario});

  // Lista de elementos hardcodeados
  static final List<Product> productos = [
    Product(
      nombre: "Notebook",
      descripcion: "Notebook 16 GB de RAM.",
      imagen: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSU3ey-sbJf8P-osxXAwZncmfbHXTXwoxEQvB_o6kstcQ&s=10",
    ),
    Product(
      nombre: "Celular",
      descripcion: "Celular Samsung",
      imagen: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSCPlrnrONonwhuFiNOc2ZzuKwaoViP03d_gC8mvwBbF8ukflmP7ZZcT_KO&s=10",
    ),
    Product(
      nombre: "Auriculares",
      descripcion: "Auriculares con cancelación de ruido.",
      imagen: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTF0RfNUQhhexFp5N3nTTguT8ycyujLwdwSmEMpoi_N0g&s=10",
    ),
    Product(
      nombre: "Computadora Gamer",
      descripcion: "PC Gamer",
      imagen: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRncLYnIkNbLIqeI2oyFHibcpnPvQ4s53yLpQ64KoMHzg&s=10",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Bienvenido ${usuario.nombre} ${usuario.apellido}",
        ),
      ),
      body: ListView.builder(
        itemCount: productos.length,
        itemBuilder: (context, index) {
          final producto = productos[index];

          return Card(
            margin: const EdgeInsets.all(10),
            child: ListTile(
              leading: Image.network(
                producto.imagen,
                width: 70,
                height: 70,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(Icons.image_not_supported, size: 50);
                },
              ),
              title: Text(
                producto.nombre,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(producto.descripcion),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                context.push(
                  "/detalle",
                  extra: producto,
                );
              },
            ),
          );
        },
      ),
    );
  }
}
