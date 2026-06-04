class Product {
  final String nombre;
  final String descripcion;
  final double precio;
  final int cantidad;

  Product? siguiente;

  Product({
    required this.nombre,
    required this.descripcion,
    required this.precio,
    required this.cantidad,
    this.siguiente,
  });
}
