import 'package:flutter/material.dart';
import 'package:parcial_flutter_testing/data/carrito.dart';
import 'package:parcial_flutter_testing/models/producto.dart';
import 'package:parcial_flutter_testing/models/validator.dart';

class CarritoCompras extends StatefulWidget {
  const CarritoCompras({super.key});

  @override
  State<CarritoCompras> createState() => _CarritoComprasState();
}

class _CarritoComprasState extends State<CarritoCompras> {

  final formkey = GlobalKey<FormState>();
  final productController = TextEditingController();
  final priceController   = TextEditingController();
  final stockController   = TextEditingController();

  List<Producto> listProduct = carrito.getItem();
  late List<Producto> listCompra = [];

  void alertDialogAdd() {
    showDialog(
      context: context, 
      builder: (context) => AlertDialog(
        
        title: const Text('Adicionar producto'),
        content: Container(
          padding: const EdgeInsets.all(5),
          child: Form(
            key: formkey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('id: ${listProduct.length + 1}'),
                TextFormField(
                  key: const ValueKey('product_id'),
                  decoration: const InputDecoration(
                    hintText: 'Name producto'
                  ),
                  onChanged: (value) => productController.text = value,
                  validator: Validator.validatorName,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                ),
                TextFormField(
                  key: const ValueKey('price_id'),
                  decoration: const InputDecoration(
                    hintText: 'Price product'
                  ),
                  onChanged: (value) => priceController.text = value,
                  validator: Validator.validatorPrice,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                ),
                TextFormField(
                  key: const ValueKey('stock_id'),
                  decoration: const InputDecoration(
                    hintText: 'Stock producto'
                  ),
                  onChanged: (value) => stockController.text = value,
                  validator: Validator.validatorStock,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                ),
              ],
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              if(formkey.currentState?.validate() ?? true){
                setState(() {
                  int id = listProduct.length + 1;
                  carrito.addItem(
                    Producto(
                      id: id, 
                      producto: productController.text, 
                      precio: double.parse( priceController.text ), 
                      stock: int.parse(stockController.text)
                    )
                  );
                  Navigator.pop(context);
                });
              }
            }, 
            child: const Text('Agregar')
          ),
          TextButton(
            onPressed: () => Navigator.pop(context), 
            child: const Text('Cancel')
          ),
        ],
      ),
    );
  }

  void alertDialogUpdateAndDelete(int index, int id, String product, String price, String stock) {

    productController.text = product;
    priceController.text   = price;
    stockController.text   = stock;

    showDialog(
      context: context, 
      builder: (context) => AlertDialog(
        title: const Text('Update and Delete'),
        content: Container(
          padding: const EdgeInsets.all(5),
          child: Form(
            key: formkey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('id: $id'),
                TextFormField(
                  key: const ValueKey('productupdated_id'),
                  decoration: const InputDecoration(
                    hintText: 'Name producto'
                  ),
                  initialValue: productController.text,
                  onChanged: (value) => productController.text = value,
                  validator: Validator.validatorName,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                ),
                TextFormField(
                  key: const ValueKey('priceupdated_id'),
                  decoration: const InputDecoration(
                    hintText: 'Price product'
                  ),
                  initialValue: priceController.text,
                  onChanged: (value) => priceController.text = value,
                  validator: Validator.validatorPrice,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                ),
                TextFormField(
                  key: const ValueKey('stockupdated_id'),
                  decoration: const InputDecoration(
                    hintText: 'Stock producto'
                  ),
                  initialValue: stockController.text,
                  onChanged: (value) => stockController.text = value,
                  validator: Validator.validatorStock,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                ),
              ],
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              if(formkey.currentState?.validate() ?? true){
                  carrito.updateItem(
                    index,
                    Producto(
                      id      : id, 
                      producto: productController.text, 
                      precio  : double.parse( priceController.text ), 
                      stock   : int.parse(stockController.text)
                    ), 
                  );
                  setState(() {});
                  Navigator.pop(context);
              }
            }, 
            child: const Text('Actualizar')
          ),
          TextButton(
            onPressed: () {
              setState(() {});
              carrito.removeItem(index);
              Navigator.pop(context);
            }, 
            child: const Text('Eliminar')
          ),
          TextButton(
            onPressed: () {
              listCompra.add(
                Producto(
                  id       : id, 
                  producto : product, 
                  precio   : double.parse(price), 
                  stock    : int.parse(stock)
                )
              );
              Navigator.pop(context);
            }, 
            child: const Text('Añadir')
          ),
        ],
      ),
    );
  }

  void alertDialogBuy(List<Producto> listCompra) {

    double total = 0;

    for (final element in listCompra) {
      total = total + element.precio;
    }

    showDialog(
      context: context, 
      builder: (context) => AlertDialog(
        title: const Text('Compra del carrito'),
        content: SizedBox(
          width: 300,
          height: 300,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 200,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(listCompra[index].producto),
                      trailing: Text('${listCompra[index].precio}'),
                    );
                  },
                  itemCount: listCompra.length,
                ),
              ),
              const SizedBox( height: 20,),
              Text('Precio total $total', style: const TextStyle( fontSize: 16, fontWeight: FontWeight.bold ),)
            ],
          ),
        ),
      ),
    );
  }

  void alertDialogVoid(){
    showDialog(
      context: context, 
      builder: (context) => const AlertDialog(
        title: Text('No hay data'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Carrito de Compras'),
        actions: [
          IconButton(
            key: const ValueKey('adicionar_iconB'),
            padding: const EdgeInsets.only( right: 10 ),
            onPressed: () =>alertDialogAdd(),
            icon: const Icon(Icons.add)
          )
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: ListView.builder(
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(listProduct[index].producto),
              trailing: Text('${listProduct[index].precio}'),
              onTap: () => alertDialogUpdateAndDelete(
                index,
                listProduct[index].id, 
                listProduct[index].producto, 
                listProduct[index].precio.toString(), 
                listProduct[index].stock.toString()
              ),
            );
          },
          itemCount: carrito.listProduct.length,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if(listCompra.isEmpty){
            alertDialogVoid();
          } else {
            alertDialogBuy(listCompra);
          }
        },
        child: const Icon(Icons.list),
      )
    );
  }
}