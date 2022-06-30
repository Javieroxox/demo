import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

PopupMenuButton(
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(10.0),
  ),
  child: Padding(
   padding: EdgeInsets.symmetric(
    horizontal: 10, 
    vertical: 20,
    ),
    child:Text("Opciones"),
  ),
  itemBuilder: (context) => [
    PopupMenuItem(
      child: Text("Editar"),
      value: 1,
    ),
    PopupMenuItem(
      child: Text("Eliminar"),
      value: 2,
    ),
  ],
}

class Item_menu extends StatefulWidget {
  const Item_menu({Key? key}) : super(key: key);

  @override
  State<Item_menu> createState() => _Item_menuState();
}

class _Item_menuState extends State<Item_menu> {
  String _selectedMenu = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          // This button presents popup menu items.
          PopupMenuButton<Menu>(
              // Callback that sets the selected popup menu item.
              onSelected: (Menu item) {
                setState(() {
                  _selectedMenu = item.name;
                });
              },
              itemBuilder: (BuildContext context) => <PopupMenuEntry<Menu>>[
                    const PopupMenuItem<Menu>(
                      value: Menu.itemOne,
                      child: Text('Item 1'),
                    ),
                    const PopupMenuItem<Menu>(
                      value: Menu.itemTwo,
                      child: Text('Item 2'),
                    ),
                    const PopupMenuItem<Menu>(
                      value: Menu.itemThree,
                      child: Text('Item 3'),
                    ),
                    const PopupMenuItem<Menu>(
                      value: Menu.itemFour,
                      child: Text('Item 4'),
                    ),
                  ])
        ],
      ),
      body: Center(
        child: Text('_selectedMenu: $_selectedMenu'),
      ),
    );
  }
}
