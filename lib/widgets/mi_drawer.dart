import 'package:flutter/material.dart';

class MiDrawer extends StatelessWidget{
  //const MiDrawer({Key? key}) : super(key: key);
  final _estiloPuntos = TextStyle(fontSize: 20);
  @override
  Widget build(BuildContext context) {
    
    return Drawer(
      
      child: _contenidoDrawer(context),
    );
  }
//Navigator.pushNamed(context, 'detail',arguments: mascota);
          //final ruta = MaterialPageRoute(builder: (_) => DetailPage());
  List<Widget> _listaDrawer(context){
    //devuelve la lista de widgets para el listview
    List<Widget> lista = [];
    lista.add(ListTile(
                title: Text("Lista de Lugares"),
                trailing: Icon(Icons.place),
                onTap: ()=> Navigator.pushNamed(context, 'mostrar_lugares')

              ));
    lista.add(ListTile(
                title: Text("Añadir un Lugar"),
                trailing: Icon(Icons.add),
                onTap: ()=>Navigator.pushNamed(context, 'add_lugares')
              ));
    lista.add(ListTile(
                title: Text("OpenStreetMap"),
                trailing: Icon(Icons.web),
                onTap: ()=>_funcionNoImplementada(context),
              ));          
    return lista;
  }

  Widget _contenidoDrawer(context){
    return Container(
      color: Colors.redAccent[200],
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 40),
            child: Row(
              children:[ 
                //foto
                  Container(
                    padding: EdgeInsets.all(5),
                    child: CircleAvatar(
                      backgroundImage: AssetImage("assets/gifs/earth_gif2.gif"),
                      maxRadius: 50,
                    ),
                  ),  
                //puntos
                SizedBox(width: 20,),
                /*
                Consumer<PuntosProvider>(
                  builder: (BuildContext context,provider,_) =>
                    Text("Puntos : ${provider.puntos}",style: _estiloPuntos,),
                  ),
                */ 
              ],
            ),
          ),
          Expanded(
          child: Container(
          color: Colors.indigo[100],
          child: ListView(
            children: 
              _listaDrawer(context)
          ),
            ),
        ),
      ]),
    ); 
  }

   //o declararlo como un Future : Future _funcionNoImplementada (context){}
  _funcionNoImplementada (context){
    return showDialog(
      context: context, 
      builder: (_) =>AlertDialog(
                title: Text("Lo sentimos"),
                content: Text("La función elegida aun no se encuentra implementada"),
                actions: [
                TextButton(onPressed: () => Navigator.pop(context), child: Text('Cancelar')), // Cerramos el diálogo
                TextButton(onPressed: (){
                // Pondríamos el código que queramos
                Navigator.pop(context,'Valor de vuelta');     // Envío de vuelta a quien llamó la información que quiera. NO ES OBLIGATORIO
                },
                child: Text('Aceptar')),
                ],
          )
      );
  }


}