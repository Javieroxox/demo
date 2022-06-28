import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../providers/Ninos_provider.dart';

class NinosPages extends StatefulWidget {

  @override
  State<NinosPages> createState() => _NinosPagesState();
}

class _NinosPagesState extends State<NinosPages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text('Infantes'),
      ),
      body: Padding(
        padding: EdgeInsets.all(5),
        child: Column(
          children: [
            Expanded(
              child: FutureBuilder(
                future: NinosProvider().getNinos(),
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
                      var infante = snap.data[index];
                      return Slidable(
                        child: ListTile(
                          leading: Icon(MdiIcons.cube),
                          title: Text('[${infante['nombre']}] + ' ' + ${infante['apellido']}'),
                          subtitle: Text('Rut: ${infante['Rut']}'),
                          trailing: Text('\$${fPrecio.format(prod['precio'])}'),
                        ),
                        startActionPane: ActionPane(
                          motion: ScrollMotion(),
                          children: [
                            SlidableAction(
                              onPressed: (context) {
                                MaterialPageRoute route = MaterialPageRoute(
                                  builder: (context) => ProductosEditarPage(prod['cod_producto']),
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
                                    ProductosProvider().productosBorrar(cod_producto).then((borradoOk) {
                                      if (borradoOk) {
                                        //pudo borrar
                                        snap.data.removeAt(index);
                                        setState(() {});
                                        showSnackbar('Producto $nombre borrado');
                                      } else {
                                        //no pudo borrar
                                        showSnackbar('No se pudo borrar el producto');
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
          ],
        ),
      ),
    );
  }
}