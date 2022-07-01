import 'package:flutter/material.dart';

class NinosModificarPage extends StatefulWidget {
  NinosModificarPage({Key? key}) : super(key: key);

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
        title: Text('Agregar Niño'),
      ),
      body: Form(
        child: Padding(
          padding: EdgeInsets.all(5.0),
          child: ListView(
            children :[
              campoRut(),
              campoNombre(),
              campoApellido(),
            ],
          ),
        ) 
      ),
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