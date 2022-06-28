import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Jardin Infantil'),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: (){}, 
              child: Text('Niños'),
            ),
            ElevatedButton(
              onPressed: (){}, 
              child: Text('Educadoras'),
            ),
            ElevatedButton(
              onPressed: (){}, 
              child: Text('Rangos'),
            ),
          ],
        ),
      ),
    );
  }
}