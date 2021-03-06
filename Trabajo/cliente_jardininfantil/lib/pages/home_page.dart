import 'package:cliente_jardininfantil/pages/educadoras_page.dart';
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
        backgroundColor: Color(0xff774466),
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
                    setState(() {});
                  });
              }, 
              child: Text('Niños'),
            ),
            ElevatedButton(
              onPressed: (){
                MaterialPageRoute route = MaterialPageRoute(builder: (context){
                  return EducadorasPage();
                });

                Navigator.push(context, route).then((value){
                  setState(() {});
                });

              }, 
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