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

  //retorna 1 niño
  Future<LinkedHashMap<String, dynamic>> getNino(String rut) async {
    var uri = Uri.parse('$apiURL/ninos/$rut');
    var respuesta = await http.get(uri);

    if (respuesta.statusCode == 200) {
      return json.decode(respuesta.body);
    } else {
      return new LinkedHashMap();
    }
  }

  //agregar niños
  Future<LinkedHashMap<String, dynamic>> postNino(
      String rut, String nombre, String apellido, int id_rango) async {
    var uri = Uri.parse('$apiURL/ninos');
    var respuesta = await http.post(uri,
        headers: <String, String>{'Content-Type': 'application/json; charset=UTF-8', 'Accept': 'application/json'},
        body: jsonEncode(
            <String, dynamic>{'rut': rut, 'nombre': nombre, 'apellido': apellido, 'id_rango': id_rango}));

    return json.decode(respuesta.body);
  }

  //edita nino
  Future<LinkedHashMap<String, dynamic>> putNino(
      String rut, String rut_nuevo, String nombre, String apellido, int id_rango) async {
    var uri = Uri.parse('$apiURL/nino/$rut');
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

  //deveria borrar a los niños
  Future<bool> ninosBorrar(String rut) async {
    var uri = Uri.parse('$apiURL/ninos/$rut');
    var respuesta = await http.delete(uri);
    return respuesta.statusCode == 200;
  }

}