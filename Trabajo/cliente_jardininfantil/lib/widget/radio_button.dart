import 'package:flutter/material.dart';

final List<String> countries = [
  'United Kingdom',
  'USA',
  'Frances',
  'Australia',
  'Germany',
  'India',
  'Vietnam'
];

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('AlertDialogs'),
        ),
        body: Center(
            child: ListView(
          children: ListTile.divideTiles(tiles: [
            ListTile(
              title: Text('Single choice Dialog'),
              onTap: () => _showSingleChoiceDialog(context),
            ),
          ], context: context)
              .toList(),
        )));
  }

  _showSingleChoiceDialog(BuildContext context) => showDialog(
        context: context,
        builder: (context) {
          final _singleNotifier = Provider.of<SingleNotifier>(context);
          return AlertDialog(
            title: Text('Select one country'),
            content: SingleChildScrollView(
              child: Container(
                width: double.infinity,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: countries
                      .map((e) => RadioListTile(
                            title: Text(e),
                            value: e,
                            groupValue: _singleNotifier.currentCountry,
                            selected: _singleNotifier.currentCountry == e,
                            onChanged: (value) {
                              _singleNotifier.updateCountry(value);
                              Navigator.of(context).pop();
                            },
                          ))
                      .toList(),
                ),
              ),
            ),
          );
        },
      );
}