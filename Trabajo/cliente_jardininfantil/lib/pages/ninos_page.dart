import 'package:flutter/material.dart';

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
    );
  }
}