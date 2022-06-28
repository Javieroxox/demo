import 'dart:collection';
import 'dart:convert';

import 'package:http/http.dart' as http;

class ProductosProvider {
  final String apiURL = 'http://10.0.2.2:8000/api';

  //retorna lista de productos
  Future<List<dynamic>> getProductos() async {
    var uri = Uri.parse('$apiURL/productos');
    var respuesta = await http.get(uri);

    if (respuesta.statusCode == 200) {
      return json.decode(respuesta.body);
    } else {
      return [];
    }
  }
}