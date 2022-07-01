import 'package:cliente_jardininfantil/pages/ninos_modificar_page.dart';
import 'package:cliente_jardininfantil/providers/educadoras_provider.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class EducadorasPage extends StatefulWidget {
  EducadorasPage({Key? key}) : super(key: key);

  @override
  State<EducadorasPage> createState() => _EducadorasPageState();
}

class _EducadorasPageState extends State<EducadorasPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff774466),
        title: Text('Educadoras Jardin'),
      ),
      body: Padding(
        padding: EdgeInsets.all(5.0),
        child: Column(
          children: [
            Expanded(
              child: FutureBuilder(
                future: EducadorasProvider().getEducadoras(),
                builder: (context, AsyncSnapshot snap){
                  if(!snap.hasData){
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }return ListView.separated(
                    separatorBuilder: (_, __) => Divider(),
                    itemCount: snap.data.length,
                    itemBuilder: (context, index){
                      var educadoras = snap.data[index];
                      return ListTile(
                            leading: Icon(MdiIcons.peanut),
                            title: Text('${educadoras['nombre']} ${educadoras['apellido']}'),
                            subtitle: Text('${educadoras['rut']}'),
                            trailing: Column(
                              children: [
                                ElevatedButton(
                                  onPressed: (){
                                    MaterialPageRoute route = MaterialPageRoute(builder: (context){
                                      return NinosModificarPage(educadoras['rut']);
                                    });
                                    Navigator.push(context, route).then((value){
                                      setState(() {});
                                    });
                                  }, 
                                  child: Text('Modificar Educadora')),
                                ElevatedButton(
                                  onPressed: (){
                                    EducadorasProvider().educadorasBorrar(educadoras.rut);
                                  }, 
                                  child: Text('Borrar Educadora')),
                              ],
                            ),
                            // onTap: (){
                            //   ButtonBar(
                            //     children: [
                            //       ElevatedButton(
                            //         onPressed: (){
                            //           MaterialPageRoute route = MaterialPageRoute(builder: (context){
                            //             return NinosAgregarPage();
                            //           },);
                            //         }, 
                            //         child: Text('Agregar Niños')
                            //       ),
                            //     ],
                            //   );
                            // },
                      );
                    },
                  );
                },
              ),
            ),
          ],
        )  
      ),
      bottomNavigationBar:BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(MdiIcons.upload),
            label: 'Agregar Educadoras',
            backgroundColor: Colors.greenAccent,
          ),
          BottomNavigationBarItem(
            icon: Icon(MdiIcons.upload),
            label: 'Otra cosa',
            backgroundColor: Colors.red,
          )
        ],
        //onTap: NinosAgregarPage(key:,);
      ),
    );
  }
}