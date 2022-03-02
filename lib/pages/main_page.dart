import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   return Scaffold(
     drawer: miDrawer(),
     floatingActionButton: FloatingActionButton(
       onPressed: (){print("Pulsaste");},
       child: Icon(Icons.add),
       
       ),
      appBar: AppBar(
        title: Text("Tourism App"),
        backgroundColor: Colors.yellow[400],

        actions: [
          Icon(Icons.search)
        ],
      ),
      body: _mapa()
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
            backgroundColor: Colors.white24,
            urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
            subdomains: ['a', 'b', 'c'],
            
          )
        ],
        
        ),
    );
  }
  
  Drawer miDrawer(){

    return Drawer(
      backgroundColor: Colors.yellow,
    );
  }
}
