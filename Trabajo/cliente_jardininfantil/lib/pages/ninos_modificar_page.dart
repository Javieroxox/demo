import 'package:cliente_jardininfantil/providers/ninos_provider.dart';
import 'package:flutter/material.dart';

class NinosModificarPage extends StatefulWidget {
  String rut;
  NinosModificarPage(this.rut,{Key? key}) : super(key: key);

  @override
  State<NinosModificarPage> createState() => _NinosModificarPageState();
}

class _NinosModificarPageState extends State<NinosModificarPage> {
  final formKey = GlobalKey<FormState>();
  TextEditingController nombreCtrl = TextEditingController();
  TextEditingController apellidoCtrl = TextEditingController();
  TextEditingController rutCtrl = TextEditingController();
  TextEditingController idCtrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff774466),
        title: Text('Editar Niño'),
      ),
      body: FutureBuilder(
        future: NinosProvider().getNino(widget.rut),
        builder: (context, AsyncSnapshot snapshot){
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
            var data = snapshot.data;
            //Aqui los pase a todos a .toString() por que tiraba error
            //pero al entrar al a pagian de modificar pone los datos como null asi que no los esta agarrando
            rutCtrl.text= data['rut'].toString();
            nombreCtrl.text = data['nombre'].toString();
            apellidoCtrl.text = data['apellido'].toString();
            idCtrl.text = data['id_rango'].toString();

            return Form(
              child: Padding(
                padding: EdgeInsets.all(5.0),
                child: ListView(
                  children: [
                    campoRut(),
                    campoNombre(),
                    campoApellido(),
                  ],
                ),
              ),
            );
        },
      )
    );
  }

  TextFormField campoRut() {
    return TextFormField(
              controller: rutCtrl,
              decoration: InputDecoration(labelText: 'Rut'),
            );
  }
  TextFormField campoNombre() {
    return TextFormField(
              controller: nombreCtrl,
              decoration: InputDecoration(labelText: 'Nombre'),
            );
  }
  TextFormField campoApellido() {
    return TextFormField(
              controller: apellidoCtrl,
              decoration: InputDecoration(labelText: 'Apellido'),
            );
  }
}