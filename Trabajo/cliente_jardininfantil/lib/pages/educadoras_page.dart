import 'package:cliente_jardininfantil/pages/ninos_agregar_page.dart';
import 'package:cliente_jardininfantil/providers/educadoras__provider.dart';
import 'package:cliente_jardininfantil/providers/rangos_provider.dart';
import 'package:cliente_jardininfantil/widget/popup_menu_button.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import '../widget/snackBar.dart';

class EducadorasPages extends StatefulWidget {

  @override
  State<EducadorasPages> createState() => _EducadorasPagesState();
}

class _EducadorasPagesState extends State<EducadorasPages> {
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
        title: Text('Profesoras'),
        actions:[Popup_Menu_Button()],
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: EdgeInsets.all(5),
        child: Column(
          children: [
            Expanded(
              child: FutureBuilder(
                future: EducadorasProvider().getEducadoras(),
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
                      var Profesoras = snap.data[index];
                      return Slidable(
                        child: ListTile(
                          leading: Icon(MdiIcons.cube, color: Colors.red[200],),
                          title: Text('${Profesoras['nombre']} ${Profesoras['apellido']}'),
                          subtitle: Text('Rut: ${Profesoras['rut']}'),
                          trailing: Snack_bar(Profesoras['rut']),
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

