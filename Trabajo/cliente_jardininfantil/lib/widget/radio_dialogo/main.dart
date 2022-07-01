import 'package:cliente_jardininfantil/providers/rangos_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'notifiers.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<SingleNotifier>(
        create: (_) => SingleNotifier(),
      ),
      ChangeNotifierProvider<MultipleNotifier>(
        create: (_) => MultipleNotifier([]),
      )
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AlertDialogs',
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('AlertDialogs'),
        ),
        body: FutureBuilder(
          future: RangosProvider().getRangos(),
          builder: (context, AsyncSnapshot snap) {
            if (!snap.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            var prod = snap.data;
            ListView.separated(
              separatorBuilder: (_, __) => Divider(),
              itemCount: snap.data.length,
              itemBuilder: (context, index) {
                var prod = snap.data[index]['nombre'];
                return prod;
              },
            );

            return _showSingleChoiceDialog(context, prod);
/*             ListView.separated(
              separatorBuilder: (_, __) => Divider(),
              itemCount: snap.data.length,
              itemBuilder: (context, index) {
                var rang = snap.data[index];
                List<String> rangoss = rang['nombre'];
                return ListTile(
                  title: Text('Single choice Dialog'),
                  onTap: () => _showSingleChoiceDialog(context, rangoss),
                );
              },
            ); */
          }
        ),
      );
  }

  _showSingleChoiceDialog(BuildContext context, List<String> rangoss) => showDialog(
        context: context,
        builder: (context) {
          final _singleNotifier = Provider.of<SingleNotifier>(context);
          return AlertDialog(
            title: Text('Rangos'),
            content: SingleChildScrollView(
              child: Container(
                width: double.infinity,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: rangoss.map((e) => RadioListTile(
                            title: Text(e),
                            value: e,
                            groupValue: _singleNotifier.currentCountry,
                            selected: _singleNotifier.currentCountry == e,
                            onChanged: (value) {
                              _singleNotifier.updateCountry(value.toString());
                              Navigator.of(context).pop();
                            },
                          )
                        ).toList(),
                ),
              ),
            ),
          );
        },
      );
}