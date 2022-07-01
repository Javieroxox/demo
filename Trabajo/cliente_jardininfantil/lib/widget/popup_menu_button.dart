import 'package:cliente_jardininfantil/pages/educadoras_page.dart';
import 'package:cliente_jardininfantil/pages/ninos_page.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kindacode.com', //de aqui lo saque la base
      home: Popup_Menu_Button(),
    );
  }
}

/* PopupMenuButton */

class Popup_Menu_Button extends StatefulWidget {

  @override
  State<Popup_Menu_Button> createState() => _Popup_Menu_ButtonState();
}

enum Menu {
  Objeto1,
  Objeto2,
}
String _selectedMenu = '';
class _Popup_Menu_ButtonState extends State<Popup_Menu_Button> {
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<Menu>(
            icon: Icon(MdiIcons.animation),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14.0),
            ),
            onSelected: (Menu item) {
              setState(() {
                _selectedMenu = item.name;
              });
            },
              itemBuilder: (BuildContext ctx) => [
                    PopupMenuItem<Menu>(
                      value: Menu.Objeto1,
                      child: TextButton(
                        onPressed: () {
                          MaterialPageRoute route = MaterialPageRoute(builder: (context) {
                            return NinosPages();
                          });
                          Navigator.push(context, route).then((value) {
                            setState(() {});
                          });
                        },
                        child: Row(
                          children: [
                            Text('Infantes', style: TextStyle(color: Colors.black,fontSize: 18),)
                          ],
                        ),
                      ),
                    ),
                    PopupMenuItem<Menu>(
                      value: Menu.Objeto2,
                      child: TextButton(
                        onPressed: () {
                          MaterialPageRoute route = MaterialPageRoute(builder: (context) {
                            return EducadorasPages();
                          });
                          Navigator.push(context, route).then((value) {
                            setState(() {});
                          });
                        },
                        child: Row(
                          children: [
                            Text('Educadoras', style: TextStyle(color: Colors.black,fontSize: 18),)
                          ],
                        ),
                      ),
                    ),
                  ]
            );
  }
}