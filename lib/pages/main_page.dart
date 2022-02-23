import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   return Scaffold(
      appBar: AppBar(
        title: Text("Hola mundo"),
        backgroundColor: Colors.red,
      ),
      body: _mapa()
      );

  }

  Widget _cuerpo(){
    return Center(
      child: Container(
        width: 300,
        height: 200,
        color: Colors.black,
      ),
    );
  }

  Widget _mapa(){
    return Container(
      child: FlutterMap(
         options: MapOptions(
          zoom: 13.0,
        ), 
        layers: [
          TileLayerOptions(
            
            minZoom: 1,
            maxZoom: 18,
            backgroundColor: Colors.red,
            urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
            subdomains: ['a', 'b', 'c']
          )
        ],
        ),
    );
  }
  
}