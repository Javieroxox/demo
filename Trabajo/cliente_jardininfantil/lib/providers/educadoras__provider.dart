import 'dart:collection';
import 'dart:convert';
import 'package:http/http.dart' as http;

class EducadorasProvider {
  final String apiURL = 'http://10.0.2.2:8000/api';

  //regresa educadoras de la api
  Future<List<dynamic>> getEducadoras() async {
    var uri = Uri.parse('$apiURL/educadoras');
    var respuesta = await http.get(uri);

    if (respuesta.statusCode == 200) {
      return json.decode(respuesta.body);
    } else {
      return [];
    }
  }

  //retorna 1 educadora
  Future<LinkedHashMap<String, dynamic>> getEducadora(String rut) async {
    var uri = Uri.parse('$apiURL/educadoras/$rut');
    var respuesta = await http.get(uri);

    if (respuesta.statusCode == 200) {
      return json.decode(respuesta.body);
    } else {
      return new LinkedHashMap();
    }
  }

  //agregar educadoras
  Future<LinkedHashMap<String, dynamic>> postEducadora(
      String rut, String nombre, String apellido, int id_rango) async {
    var uri = Uri.parse('$apiURL/educadoras');
    var respuesta = await http.post(uri,
        headers: <String, String>{'Content-Type': 'application/json; charset=UTF-8', 'Accept': 'application/json'},
        body: jsonEncode(
            <String, dynamic>{'rut': rut, 'nombre': nombre, 'apellido': apellido, 'id_rango': id_rango}));

    return json.decode(respuesta.body);
  }

  //edita educadora
  Future<LinkedHashMap<String, dynamic>> putEducadora(
      String rut, String rut_nuevo, String nombre, String apellido, int id_rango) async {
    var uri = Uri.parse('$apiURL/educadoras/$rut');
    var respuesta = await http.put(uri,
        headers: <String, String>{'Content-Type': 'application/json; charset=UTF-8', 'Accept': 'application/json'},
        body: jsonEncode(<String, dynamic>{
          'rut': rut,
          'rut_nuevo': rut_nuevo,
          'nombre': nombre,
          'apellido': apellido,
          'id_rango': id_rango
        }));

    return json.decode(respuesta.body);
  }

  //deveria borrar a la educadora
  Future<bool> deleteEducadora(String rut) async {
    var uri = Uri.parse('$apiURL/educadoras/$rut');
    var respuesta = await http.delete(uri);
    return respuesta.statusCode == 200;
  }

}