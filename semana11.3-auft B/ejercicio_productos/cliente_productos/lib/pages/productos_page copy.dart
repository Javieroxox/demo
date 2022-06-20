import 'package:cliente_productos/pages/productos_agregar_page.dart';
import 'package:cliente_productos/providers/productos_provider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class ProductosPage extends StatefulWidget {
  @override
  State<ProductosPage> createState() => _ProductosPageState();
}

class _ProductosPageState extends State<ProductosPage> {
  final fPrecio = NumberFormat.currency(decimalDigits: 0, locale: 'es-CL', symbol: '');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Productos'),
      ),
      body: Padding(
        padding: EdgeInsets.all(5),
        child: Column(
          children: [
            Expanded(
              child: FutureBuilder(
                future: ProductosProvider().getProductos(),
                builder: (context, AsyncSnapshot snap) {
                  if (!snap.hasData) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return ListView.separated(
                    separatorBuilder: (_, __) => Divider(),
                    itemCount: snap.data.length,
                    itemBuilder: (context, index) {
                      var prod = snap.data[index];
                      return Dismissible(
                        key: ObjectKey(prod),
                        direction: DismissDirection.endToStart,
                        background: Container(
                          color: Colors.purple,
                        ),
                        secondaryBackground: Container(
                          padding: EdgeInsets.only(right: 10),
                          alignment: Alignment.centerRight,
                          color: Colors.red,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                'Borrar',
                                style: TextStyle(color: Colors.white),
                              ),
                              Icon(
                                MdiIcons.trashCan,
                                color: Colors.white,
                              )
                            ],
                          ),
                        ),
                        onDismissed: (direction) {
                          // if (direction == DismissDirection.startToEnd) {
                          //   print('StartToEnd');
                          // } else {
                          //   print('EndToStart');
                          // }

                          String cod_producto = prod['cod_producto'];
                          // print(cod_producto);

                          ProductosProvider().productosBorrar(cod_producto).then((borradoOk) {
                            if (borradoOk) {
                              //pudo borrar
                              snap.data.removeAt(index);
                              setState(() {});
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  duration: Duration(seconds: 2),
                                  content: Text('Producto borrado'),
                                ),
                              );
                            } else {
                              //no pudo borrar
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  duration: Duration(seconds: 2),
                                  content: Text('No se pudo borrar el producto :('),
                                ),
                              );
                            }
                          });
                        },
                        child: ListTile(
                          leading: Icon(MdiIcons.cube),
                          title: Text(prod['nombre']),
                          subtitle: Text('Stock: ${prod['stock']}'),
                          trailing: Text('\$${fPrecio.format(prod['precio'])}'),
                        ),
                      );
                    },
                  );
                },
              ),
            ),

            //boton agregar
            Container(
              width: double.infinity,
              child: ElevatedButton(
                child: Text('Agregar Producto'),
                onPressed: () {
                  MaterialPageRoute route = MaterialPageRoute(builder: (context) {
                    return ProductosAgregarPage();
                  });

                  Navigator.push(context, route).then((value) {
                    print('ACTUALIZAR PAGINA');
                    setState(() {});
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
