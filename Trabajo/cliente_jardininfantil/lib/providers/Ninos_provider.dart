import 'dart:collection';
import 'dart:convert';
import 'package:http/http.dart' as http;

class NinosProvider {
  final String apiURL = 'http://10.0.2.2:8000/api';

  //regresa ninos de la api
  Future<List<dynamic>> getNinos() async {
    var uri = Uri.parse('$apiURL/ninos');
    var respuesta = await http.get(uri);

    if (respuesta.statusCode == 200) {
      return json.decode(respuesta.body);
    } else {
      return [];
    }
  }

  //deveria borrar a los niños
  Future<bool> ninosBorrar(String rut) async {
    var uri = Uri.parse('$apiURL/ninos/$rut');
    var respuesta = await http.delete(uri);
    return respuesta.statusCode == 200;
  }

}