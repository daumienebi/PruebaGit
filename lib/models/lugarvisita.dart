import 'package:pruebapc/db/lugarvisita_database.dart';

class CamposLugarVisita{

  static final String id = 'id';
  static final String nombre ='nombre';
  static final String descripcion = 'descripcion';
  static final String coordenada = 'coordenada';
  static final String time = 'time'; 


  //crear una lista estatica con el nombre de los valores para ayudar en la obtencion de datos de la bbd
  static final List <String> valores =[id,nombre,descripcion,coordenada];
}

class LugarVisita{
  final int? id;
  final String nombre;
  final String descripcion;
  final String coordenada;

const LugarVisita({this.id,required this.nombre,required this.descripcion,required this.coordenada});


//clase para convertir el LugarVisita a un Mapa
Map<String,Object?> toJson(){
  return{
    CamposLugarVisita.id  : id,
    CamposLugarVisita.nombre : nombre,
    CamposLugarVisita.descripcion : descripcion,
    CamposLugarVisita.coordenada : coordenada
  };
}


LugarVisita copy({
  int? id,
  String? nombre,
  String? descripcion,
  String ?coordenada,}) => LugarVisita(
  id: id?? this.id,
  nombre: nombre ?? this.nombre, 
  descripcion: descripcion ?? this.descripcion, 
  coordenada: coordenada ?? this.coordenada
  );

  static LugarVisita fromJson(Map<String, Object?> json) {
    //convertir los datos de un json a objeto de tipo LugarVisita
    return LugarVisita(
      id: json[CamposLugarVisita.id] as int?,
      nombre: json[CamposLugarVisita.nombre] as String,
      descripcion: json[CamposLugarVisita.descripcion] as String, 
      coordenada: json[CamposLugarVisita.coordenada] as String
      );
  }

  factory LugarVisita.fromMap(Map<String,dynamic> dato) =>

  LugarVisita(
    id: dato["id"],
    nombre: dato["nombre"],
    descripcion: dato["descripcion"],
    coordenada: dato["coordenada"],
  );

}