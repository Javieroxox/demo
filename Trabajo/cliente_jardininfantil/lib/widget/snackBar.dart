import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import '../providers/ninos_provider.dart';

//void main() => runApp(MyApp());


class Snack_bar extends StatelessWidget {

  String rut;
  Snack_bar(this.rut, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
              onPrimary:Colors.black,
              primary: Colors.red,
            ),
      child: Icon(MdiIcons.closeBoxOutline,color: Colors.white,),
      onPressed: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            action: SnackBarAction(
              label: 'Eliminar',
              onPressed: () {
                NinosProvider().ninosBorrar(rut);
              },
            ),
            content: const Text('¿Decea eliminarlo?'),
            duration: const Duration(milliseconds: 3000),
            width: 280.0, // Width of the SnackBar.
            padding: const EdgeInsets.symmetric(
              horizontal: 8.0, // Inner padding for SnackBar content.
            ),
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        );
      },
    );
  }
}
