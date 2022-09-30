import 'package:parcial_flutter_testing/models/producto.dart';

final carrito = _Carrito();

class _Carrito {

  final listProduct = <Producto>[
    Producto(id: 1, producto: 'Redmi 9 pro',     precio: 1200.60, stock: 10),
    Producto(id: 2, producto: 'Redmi 8 pro',     precio: 950.00,  stock: 40),
    Producto(id: 3, producto: 'Sansung s10 Pro', precio: 2600.10, stock: 6),
    Producto(id: 4, producto: 'Huawei P20 Pro',  precio: 2800.30, stock: 9),
    Producto(id: 5, producto: 'Huawei P40 Pro',  precio: 5230.90, stock: 40),
    Producto(id: 6, producto: 'Alcatel S3',      precio: 700.00,  stock: 50),
  ];

  getItem(){
    return listProduct;
  }

  addItem(Producto producto) {
    listProduct.add(producto);
  }

  updateItem(int index, Producto producto){

    listProduct[index] = producto;

  }

  removeItem(int index){
    listProduct.removeAt(index);
  }

}

