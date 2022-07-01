import 'package:flutter/material.dart';

class EducadorasAgregarPage extends StatefulWidget {
  EducadorasAgregarPage({Key? key}) : super(key: key);

  @override
  State<EducadorasAgregarPage> createState() => _EducadorasAgregarPageState();
}

class _EducadorasAgregarPageState extends State<EducadorasAgregarPage> {
  final formKey = GlobalKey<FormState>();
  TextEditingController nombreCtrl = TextEditingController();
  TextEditingController apellidoCtrl = TextEditingController();
  TextEditingController rutCtrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff774466),
        title: Text('Agregar Educadora'),
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