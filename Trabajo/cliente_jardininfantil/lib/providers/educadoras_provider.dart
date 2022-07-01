import 'dart:collection';
import 'dart:convert';
import 'package:http/http.dart' as http;

class EducadorasProvider {
  final String apiURL = 'http://10.0.2.2:8000/api';
//Obtencion +1
  Future<List<dynamic>> getEducadoras() async {
    var uri = Uri.parse('$apiURL/educadoras');
    var respuesta = await http.get(uri);

    if (respuesta.statusCode == 200) {
      return json.decode(respuesta.body);
    } else {
      return [];
    }
  }
//Obtencion 1
Future<LinkedHashMap<String, dynamic>> getEducadora(String rut) async {
    var uri = Uri.parse('$apiURL/jardin/educadoras/$rut');
    var respuesta = await http.get(uri);

    if (respuesta.statusCode == 200) {
      return json.decode(respuesta.body);
    } else {
      return new LinkedHashMap();
    }
  }

  Future<LinkedHashMap<String, dynamic>> educadorasAgregar(
    String rut, String nombre, String apellido) async {
    var uri = Uri.parse('$apiURL/jardin/educadoras');
    var respuesta = await http.post(uri,
        headers: <String, String>{'Content-Type': 'application/json; charset=UTF-8', 'Accept': 'application/json'},
        body: jsonEncode(
            <String, dynamic>{'rut': rut, 'nombre': nombre, 'apellido': apellido}));

    return json.decode(respuesta.body);
  }

//Eliminado
  Future<bool> educadorasBorrar(String rut) async {
    var uri = Uri.parse('$apiURL/jardin/educadoras/$rut');
    var respuesta = await http.delete(uri);
    return respuesta.statusCode == 200;
  }
}