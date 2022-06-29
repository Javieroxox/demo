import 'package:cliente_jardininfantil/providers/ninos_provider.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class NinosPage extends StatefulWidget {
  NinosPage({Key? key}) : super(key: key);

  @override
  State<NinosPage> createState() => _NinosPageState();
}

class _NinosPageState extends State<NinosPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Niños Jardin'),
      ),
      body: Padding(
        padding: EdgeInsets.all(5.0),
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
    );
  }
}