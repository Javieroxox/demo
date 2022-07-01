import 'package:cliente_jardininfantil/providers/ninos_provider.dart';
import 'package:flutter/material.dart';

class NinosEditPages extends StatefulWidget {
  String rut;
  NinosEditPages(this.rut, {Key? key}) : super(key: key);

  @override
  State<NinosEditPages> createState() => _NinosEditPagesState();
}

class _NinosEditPagesState extends State<NinosEditPages> {
  TextEditingController rutCtrl = TextEditingController();
  TextEditingController nombreCtrl = TextEditingController();
  TextEditingController apellidoCtrl = TextEditingController();
  TextEditingController Id_rangoCtrl = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // ProductosProvider().getProducto(widget.codProducto).then((data) {
    //   codigoCtrl.text = data['cod_producto'];
    //   nombreCtrl.text = data['nombre'];
    //   stockCtrl.text = data['stock'].toString();
    //   precioCtrl.text = data['precio'].toString();
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Editar infante'),
        backgroundColor: Colors.deepPurple,
      ),
      body: FutureBuilder(
          future: NinosProvider().getNino(widget.rut),
          builder: (context, AsyncSnapshot snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            var data = snapshot.data;
            rutCtrl.text = data['rut'];
            nombreCtrl.text = data['nombre'];
            apellidoCtrl.text = data['apellido'];
            Id_rangoCtrl.text = data['id_rango'].toString();

            return Form(
              key: formKey,
              child: ListView(
                children: [
                  TextFormField(
                    controller: rutCtrl,
                    decoration: InputDecoration(labelText: 'Rut'),
                  ),
                  TextFormField(
                    controller: nombreCtrl,
                    decoration: InputDecoration(labelText: 'Nombre'),
                  ),
                  TextFormField(
                    controller: apellidoCtrl,
                    decoration: InputDecoration(labelText: 'Apellido'),
                  ),
                  TextFormField(
                    controller: Id_rangoCtrl,
                    decoration: InputDecoration(labelText: 'Rango'),
                  ),
                  Container(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        onPrimary:Colors.white,
                        primary: Colors.deepPurple,
                      ),
                      child: Text('Editar'),
                      onPressed: () {
                        NinosProvider().putNino(
                          widget.rut,
                          rutCtrl.text.trim(),
                          nombreCtrl.text.trim(),
                          apellidoCtrl.text.trim(),
                          int.tryParse(Id_rangoCtrl.text.trim()) ?? 0,
                        );
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
