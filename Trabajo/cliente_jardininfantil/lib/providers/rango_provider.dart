import 'dart:collection';
import 'dart:convert';
import 'package:http/http.dart' as http;

class RangosProvider {
  final String apiURL = 'http://10.0.2.2:8000/api';

  //regresa rangos de la api
  Future<List<dynamic>> getRangos() async {
    var uri = Uri.parse('$apiURL/rangos');
    var respuesta = await http.get(uri);

    if (respuesta.statusCode == 200) {
      return json.decode(respuesta.body);
    } else {
      return [];
    }
  }

  //agregar niños
  Future<LinkedHashMap<String, dynamic>> postNinos(
      String nombre) async {
    var uri = Uri.parse('$apiURL/rangos');
    var respuesta = await http.post(uri,
        headers: <String, String>{'Content-Type': 'application/json; charset=UTF-8', 'Accept': 'application/json'},
        body: jsonEncode(
            <String, dynamic>{'nombre': nombre}));

    return json.decode(respuesta.body);
  }

  //deveria borrar a los niños
  Future<bool> ninosBorrar(int id) async {
    var uri = Uri.parse('$apiURL/rangos/$id');
    var respuesta = await http.delete(uri);
    return respuesta.statusCode == 200;
  }

}