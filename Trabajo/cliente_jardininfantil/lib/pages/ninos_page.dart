import 'package:cliente_jardininfantil/pages/ninos_agregar_page.dart';
import 'package:cliente_jardininfantil/pages/ninos_modificar_page.dart';
import 'package:cliente_jardininfantil/providers/ninos_provider.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class NinosPage extends StatefulWidget {
  NinosPage({Key? key}) : super(key: key);

  @override
  State<NinosPage> createState() => _NinosPageState();
}

class _NinosPageState extends State<NinosPage> {
  int _selectedIndex = 0;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff774466),
        title: Text('Niños Jardin'),
      ),
      body: Padding(
        padding: EdgeInsets.all(0),
        child: Column(
          children: [
            Expanded(
              child: FutureBuilder(
                future: NinosProvider().getNinos(),
                builder: (context, AsyncSnapshot snap){
                  if(!snap.hasData){
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }return ListView.separated(
                    separatorBuilder: (_, __) => Divider(),
                    itemCount: snap.data.length,
                    itemBuilder: (context, index){
                      var ninos = snap.data[index];
                      return ListTile(
                            leading: Icon(MdiIcons.peanut),
                            title: Text('${ninos['nombre']} ${ninos['apellido']}'),
                            subtitle: Text('${ninos['rut']}'),
                            trailing: Column(
                              children: [
                                ElevatedButton(
                                  onPressed: (){
                                    MaterialPageRoute route = MaterialPageRoute(builder: (context){
                                      return NinosModificarPage(ninos['rut']);
                                    });
                                    Navigator.push(context, route).then((value){
                                      setState(() {});
                                    });
                                  }, 
                                  child: Text('Modificar Niño')),
                                ElevatedButton(
                                  onPressed: (){
                                    NinosProvider().ninosBorrar(ninos.rut);
                                    // MaterialPageRoute route = MaterialPageRoute(builder: (context){
                                    //   return NinosAgregarPage();
                                    // });
                                    // Navigator.push(context, route).then((value){
                                    //   setState(() {});
                                    // });
                                  }, 
                                  child: Text('Borrar Niño')),
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
                  // }return Slidable(
                  //       child: ListTile(
                  //         leading: Icon(MdiIcons.cube),
                  //         title: Text('[${prod['cod_producto']}] ${prod['nombre']}'),
                  //         subtitle: Text('Stock: ${prod['stock']}'),
                  //         trailing: Text('\$${fPrecio.format(prod['precio'])}'),
                  //       ),
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
            label: 'Agregar Niños',
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