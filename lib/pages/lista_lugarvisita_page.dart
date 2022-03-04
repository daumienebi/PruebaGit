import 'package:flutter/material.dart';

class ListaLugarVisita extends StatelessWidget {
  ListaLugarVisita({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista de lugares"),
      ),
      body: Container(
        color: Colors.yellow,
      ),
    );
  }
}