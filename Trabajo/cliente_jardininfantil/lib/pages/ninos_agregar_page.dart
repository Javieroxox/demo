import 'package:cliente_jardininfantil/providers/ninos_provider.dart';
import 'package:flutter/material.dart';

class NinosAgregarPage extends StatefulWidget {
  NinosAgregarPage({Key? key}) : super(key: key);

  @override
  State<NinosAgregarPage> createState() => _NinosAgregarPageState();
}

class _NinosAgregarPageState extends State<NinosAgregarPage> {
  final formKey = GlobalKey<FormState>();
  TextEditingController rutCtrl = TextEditingController();
  TextEditingController nombreCtrl = TextEditingController();
  TextEditingController ApellidoCtrl = TextEditingController();
  TextEditingController Id_rangoCtrl = TextEditingController();

  String errRut = '';
  String errNombre = '';
  String errApellido = '';
  String errId_rango = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Infante'),
      ),
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              TextFormField(
                controller: rutCtrl,
                decoration: InputDecoration(labelText: 'Rut'),
              ),
              Container(
                width: double.infinity,
                child: Text(
                  errRut,
                  style: TextStyle(color: Colors.red),
                ),
              ),
              TextFormField(
                controller: nombreCtrl,
                decoration: InputDecoration(labelText: 'Nombre'),
              ),
              Container(
                width: double.infinity,
                child: Text(
                  errNombre,
                  style: TextStyle(color: Colors.red),
                ),
              ),
              TextFormField(
                controller: ApellidoCtrl,
                decoration: InputDecoration(labelText: 'Apellido'),
              ),
              Container(
                width: double.infinity,
                child: Text(
                  errApellido,
                  style: TextStyle(color: Colors.red),
                ),
              ),
              TextFormField(
                controller: Id_rangoCtrl,
                decoration: InputDecoration(labelText: 'Id_rango'),
                keyboardType: TextInputType.number,
              ),
              Container(
                width: double.infinity,
                child: ElevatedButton(
                  child: Text('Agregar Producto'),
                  onPressed: () async {

                    var respuesta = await NinosProvider().postNinos(
                      rutCtrl.text.trim(),
                      nombreCtrl.text.trim(),
                      ApellidoCtrl.text.trim(),
                      Id_rangoCtrl,
                    );

                    if (respuesta['message'] != null) {
                      //rut
                      if (respuesta['errors']['rut'] != null) {
                        errRut = respuesta['errors']['rut'][0];
                      }

                      //nombre
                      if (respuesta['errors']['nombre'] != null) {
                        errNombre = respuesta['errors']['nombre'][0];
                      }

                      //apellido
                      if (respuesta['errors']['apellido'] != null) {
                        errApellido = respuesta['errors']['apellido'][0];
                      }

                      //id_rango
                      if (respuesta['errors']['id_rango'] != null) {
                        errId_rango = respuesta['errors']['id_rango'][0];
                      }
                      setState(() {});
                      return;
                    }
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
