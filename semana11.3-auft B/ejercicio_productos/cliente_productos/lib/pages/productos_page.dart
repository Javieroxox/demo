import 'package:cliente_productos/pages/productos_agregar_page.dart';
import 'package:cliente_productos/pages/productos_editar_pages.dart';
import 'package:cliente_productos/providers/productos_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class ProductosPage extends StatefulWidget {
  @override
  State<ProductosPage> createState() => _ProductosPageState();
}

class _ProductosPageState extends State<ProductosPage> {
  final fPrecio =
      NumberFormat.currency(decimalDigits: 0, locale: 'es-CL', symbol: '');

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
                      return Slidable(
                        child: ListTile(
                          leading: Icon(MdiIcons.cube),
                          title: Text(prod['nombre']),
                          subtitle: Text('Codigo: ${prod['cod_producto']}' +
                              ' ' +
                              'Stock: ${prod['stock']}'),
                          trailing: Text('\$${fPrecio.format(prod['precio'])}'),
                        ),
                        startActionPane: ActionPane(
                          motion: ScrollMotion(),
                          children: [
                            SlidableAction(
                              onPressed: (context) {
                                MaterialPageRoute route = MaterialPageRoute(
                                  builder: (context) =>
                                      ProductosEditarPage(prod['cod_producto']),
                                );
                                Navigator.push(context, route).then((value) {
                                  setState(() {});
                                });
                              },
                              backgroundColor: Colors.purple,
                              icon: MdiIcons.pen,
                              label: 'Editar',
                            ),
                          ],
                        ),
                        endActionPane: ActionPane(
                          motion: ScrollMotion(),
                          children: [
                            SlidableAction(
                              onPressed: (context) {
                                String cod_producto = prod['cod_producto'];
                                String nombre = prod['nombre'];

                                confirmDialog(context, nombre).then((confirma) {
                                  if (confirma) {
                                    //borrar
                                    ProductosProvider()
                                        .productosBorrar(cod_producto)
                                        .then((borradoOk) {
                                      if (borradoOk) {
                                        //pudo borrar
                                        snap.data.removeAt(index);
                                        setState(() {});
                                        showSnackbar(
                                            'Producto $nombre borrado');
                                      } else {
                                        //no pudo borrar
                                        showSnackbar(
                                            'No se pudo borrar el producto');
                                      }
                                    });
                                  }
                                });
                              },
                              backgroundColor: Colors.red,
                              icon: MdiIcons.trashCan,
                              label: 'Borrar',
                            ),
                          ],
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
                  MaterialPageRoute route =
                      MaterialPageRoute(builder: (context) {
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

  void showSnackbar(String mensaje) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: Duration(seconds: 2),
        content: Text(mensaje),
      ),
    );
  }

  Future<dynamic> confirmDialog(BuildContext context, String producto) {
    return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Confirmar borrado'),
          content: Text('¿Borrar el producto $producto?'),
          actions: [
            TextButton(
              child: Text('CANCELAR'),
              onPressed: () => Navigator.pop(context, false),
            ),
            ElevatedButton(
              child: Text('ACEPTAR'),
              onPressed: () => Navigator.pop(context, true),
            ),
          ],
        );
      },
    );
  }
}
