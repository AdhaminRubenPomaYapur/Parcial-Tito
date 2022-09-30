import 'package:flutter/material.dart';

class Producto {

  final int      id;
  final IconData icon = Icons.mobile_friendly;
  final String   producto;
  final double   precio;
  final int      stock;

  Producto({
    required this.id,
    required this.producto,
    required this.precio,
    required this.stock
  });

  set id       (int id)          => this.id       = id;
  set producto (String producto) => this.producto = producto;
  set precio   (double precio)   => this.precio   = precio;
  set stock    (int stock)       => this.stock    = stock;

}