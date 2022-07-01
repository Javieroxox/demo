import 'package:cliente_jardininfantil/pages/ninos_agregar_page.dart';
import 'package:cliente_jardininfantil/providers/rangos_provider.dart';
import 'package:cliente_jardininfantil/widget/Popup_Menu_Button.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../providers/ninos_provider.dart';
import '../widget/snackBar.dart';

class NinosPages extends StatefulWidget {

  @override
  State<NinosPages> createState() => _NinosPagesState();
}

class _NinosPagesState extends State<NinosPages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        leading: ElevatedButton(
            style: ElevatedButton.styleFrom(
              onPrimary:Colors.white,
              primary: Colors.deepPurple,
            ),  
          child: Icon(MdiIcons.accountPlus),
          onPressed: () {
            MaterialPageRoute route = MaterialPageRoute(builder: (context) {
              return NinosAgregarPage();
            });
            Navigator.push(context, route).then((value) {
              setState(() {});
            });
          },
        ),
        title: Text('Infantes'),
        actions:[Popup_Menu_Button()],
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: EdgeInsets.all(5),
        child: Column(
          children: [
            Expanded(
              child: FutureBuilder(
                future: NinosProvider().getNinos(),
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
                      var infante = snap.data[index];
                      return Slidable(
                        child: ListTile(
                          leading: Icon(MdiIcons.cube, color: Colors.red[200],),
                          title: Text('${infante['nombre']} ${infante['apellido']}'),
                          subtitle: Text('Rut: ${infante['rut']}'),
                          trailing: Snack_bar(infante['rut']),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
