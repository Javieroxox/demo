import 'package:cliente_jardininfantil/pages/ninos_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
              onPressed: (){
                  MaterialPageRoute route = MaterialPageRoute(builder: (context) {
                    return NinosPage();
                  });

                  Navigator.push(context, route).then((value) {
                    print('ACTUALIZAR PAGINA');
                    setState(() {});
                  });
              }, 
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