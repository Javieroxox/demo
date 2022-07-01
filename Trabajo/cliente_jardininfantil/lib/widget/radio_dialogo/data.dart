import 'package:cliente_jardininfantil/providers/rangos_provider.dart';
import 'package:flutter/material.dart';

/* final List<String> countries = [
  'United Kingdom',
  'USA',
  'Frances',
  'Australia',
  'Germany',
  'India',
  'Vietnam'
]; */


final List<String> countries = <String>[];

/* final List<String> rang = rang['nombre']; */
void main() => runApp(data());

class data extends StatefulWidget {

  @override
  State<data> createState() => _dataState();
}

class _dataState extends State<data> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('rango'),
      ),
      body: Padding(
        padding: EdgeInsets.all(5),
        child: Expanded(
          child: FutureBuilder(
            future: RangosProvider().getRangos(),
            builder: (context, AsyncSnapshot snap) {
              if (!snap.hasData) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              return ListView.separated(
                separatorBuilder: (_, __) => Divider(),
                itemCount: snap.data.length,
                itemBuilder: (context, index) {
                  var rang = snap.data[index];
                  for (var i = 0; i < 5; i++) {
                    countries.insert(i,rang['nombre']);
                    print(countries[i]);
                  }
                  return Text('listo');
                },
              );
            },
          ),
        ),
      ),
    );
  }
}