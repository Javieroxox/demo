import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import '../providers/productos_provider.dart';

class ProductosEditarPage extends StatefulWidget {
  String codProducto;
  ProductosEditarPage(this.codProducto, {Key? key}) : super(key: key);

  @override
  State<ProductosEditarPage> createState() => _ProductosEditarPageState();
}

class _ProductosEditarPageState extends State<ProductosEditarPage> {
  final formKey = GlobalKey<FormState>();
  TextEditingController codigoCtrl = TextEditingController();
  TextEditingController nombreCtrl = TextEditingController();
  TextEditingController stockCtrl = TextEditingController();
  TextEditingController precioCtrl = TextEditingController();

//@override
//inistate es para cargar datos al inicio
//void initState() {
  // TODO: implement initState
//  super.initState();
//    ProductosProvider().getProducto(widget.codProducto).then((data) {
//      codigoCtrl.text = data['cod_producto'];
//      nombreCtrl.text = data['nombre'];
//      stockCtrl.text = data['stock'].toString();
//      precioCtrl.text = data['precio'].toString();
//      print(data['nombre'])
//    });
//  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Editar Productos'),
      ),
      body: FutureBuilder(
          future: ProductosProvider().getProducto(widget.codProducto),
          builder: (context, AsyncSnapshot snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            var data = snapshot.data;
            codigoCtrl.text = data['cod_producto'];
            nombreCtrl.text = data['nombre'];
            stockCtrl.text = data['stock'].toString();
            precioCtrl.text = data['precio'].toString();
            return Form(
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView(
                  children: [
                    TextFormField(
                      controller: codigoCtrl,
                      decoration: InputDecoration(labelText: 'Código'),
                    ),
                    TextFormField(
                      controller: nombreCtrl,
                      decoration: InputDecoration(labelText: 'Nombre'),
                    ),
                    TextFormField(
                      controller: stockCtrl,
                      decoration: InputDecoration(labelText: 'Stock'),
                    ),
                    TextFormField(
                      controller: precioCtrl,
                      decoration: InputDecoration(labelText: 'Precio'),
                    ),
                    Container(
                      width: double.infinity,
                      child: ElevatedButton(
                        child: Text('Editar'),
                        onPressed: () {
                          ProductosProvider().productosEditar(
                            widget.codProducto,
                            codigoCtrl.text.trim(),
                            nombreCtrl.text.trim(),
                            int.tryParse(stockCtrl.text) ?? 0,
                            int.tryParse(precioCtrl.text) ?? 0,
                          );
                          Navigator.pop(context);
                        },
                      ),
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
