import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:pruebapc/widgets/mi_drawer.dart';
import 'package:pruebapc/widgets/mi_mapa.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   return Scaffold(
     drawer: MiDrawer(),
     floatingActionButton: FloatingActionButton(
       onPressed: (){
         showSimplePickerLocation(
                      context: context,
                      isDismissible: true,
                      title: "Elegir lugar",
                      textConfirmPicker: "Aceptar",
                      textCancelPicker: 'Cancelar',
                      initCurrentUserPosition: true,

                    );
         //Navigator.pushNamed(context, 'add_lugares');
       },
       child: Icon(Icons.add),
       
       ),
      appBar: AppBar(
        title: Text("Turismo"),
        //backgroundColor: Colors.yellow[400],

        actions: [
          Container(
            margin: EdgeInsets.only(right: 10),
            child: Icon(Icons.search,size: 25,)
            )
        ],
      ),
      body: MiMapa()
      );

  }
  
}
