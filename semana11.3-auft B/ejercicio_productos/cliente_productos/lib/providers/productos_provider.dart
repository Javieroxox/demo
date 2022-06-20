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

  //retorna un de productos
  Future<LinkedHashMap<String, dynamic>> getProducto(String codProducto) async {
    var uri = Uri.parse('$apiURL/productos/$codProducto');
    var respuesta = await http.get(uri);

    if (respuesta.statusCode == 200) {
      return json.decode(respuesta.body);
    } else {
      return new LinkedHashMap();
    }
  }

  //agrega productos
  Future<LinkedHashMap<String, dynamic>> productosAgregar(
      String cod_producto, String nombre, int stock, int precio) async {
    var uri = Uri.parse('$apiURL/productos');
    var respuesta = await http.post(uri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Accept': 'application/json'
        },
        body: jsonEncode(<String, dynamic>{
          'cod_producto': cod_producto,
          'nombre': nombre,
          'stock': stock,
          'precio': precio
        }));
    return json.decode(respuesta.body);
  }

  //borra prodcutos
  Future<bool> productosBorrar(String cod_producto) async {
    var uri = Uri.parse('$apiURL/productos/$cod_producto');
    var respuesta = await http.delete(uri);
    return respuesta.statusCode == 200;
  }

  //editar productos
  Future<LinkedHashMap<String, dynamic>> productosEditar(String cod_producto,
      String cod_producto_nuevo, String nombre, int stock, int precio) async {
    var uri = Uri.parse('$apiURL/productos/$cod_producto');
    var respuesta = await http.put(uri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Accept': 'application/json'
        },
        body: jsonEncode(<String, dynamic>{
          'cod_producto': cod_producto,
          'cod_producto_nuevo': cod_producto_nuevo,
          'nombre': nombre,
          'stock': stock,
          'precio': precio
        }));
    return json.decode(respuesta.body);
  }
}
