import 'package:flutter/material.dart';
import 'package:pruebapc/db/lugarvisita_database.dart';
import 'package:pruebapc/models/lugarvisita.dart';

class AddLugarVisitaPage extends StatelessWidget {
  const AddLugarVisitaPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.close,color: Colors.black,),label: "Cerrar"),
          BottomNavigationBarItem(icon: Icon(Icons.add,color: Colors.black,),label: "Añadir")
        ],
        ),
      appBar: AppBar(
        title: Text("Añadir Lugares de Interes"),
      ),
      body:  Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          
          _camposPrueba(),
         
        ],
      ),
    );
  }

  Widget _camposPrueba(){
    TextEditingController cntlNombre = TextEditingController();
    TextEditingController cntlDesc = TextEditingController();
    TextEditingController cntlCoord = TextEditingController();
   // LugarVisita lugar;
    return Container(
      padding: EdgeInsets.all(15),
      child: Column(    
        
        children: [
           TextField(
             controller: cntlNombre,
              decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Nombre del lugar',
            ),
          ),
            TextFormField(
              controller: cntlCoord,
              decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Coordenada',
              
            ),
          ),
           TextField(
             
             controller: cntlDesc,
             maxLines: 5,
              decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Descripcion del sitio',
              
            ),
           ),
         
            GestureDetector(
              onTap: () async {

              LugarVisita lugarVisita =  LugarVisita(nombre: cntlNombre.text, descripcion: cntlDesc.text, coordenada: cntlCoord.text);
              //print("${lugarVisita.nombre} ${lugarVisita.descripcion}");
              try{
               await LugarVisitaDatabase.instance.crearLugarVisita(lugarVisita);
               print("Lugar añadido");
              }on Exception catch (Exception, ex){
                  print(StackTrace.current);
              }finally{
                LugarVisitaDatabase.instance.cerrar();
              }
              
              
              },
              
              child:Icon(Icons.save,size: 50,)
              ),

               GestureDetector(
              onTap: () async {
                _getLugarVisitas();
              },
              
              child:Icon(Icons.get_app,size: 50,)
              )
        ],
       
      ),
    ); 
    
  }
  

  _getLugarVisitas() async {
    List<LugarVisita> lugares = [];
     try{
          lugares =  await LugarVisitaDatabase.instance.obtenerTodosLosLugarVisita();
          for(LugarVisita l in lugares){
            print('${l.id} -${l.nombre} - ${l.coordenada} - ${l.descripcion} ');
          }              
    }on Exception catch (Exception, ex){
        print(StackTrace.current);
    }finally{
      LugarVisitaDatabase.instance.cerrar();
    }
  }

  
}

class MiTextField extends StatelessWidget {
  const MiTextField({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}