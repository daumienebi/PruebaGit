import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:pruebapc/models/lugarvisita.dart';

class LugarVisitaDatabase{
  static final nombretabla = 'lugarvisita';
  static final LugarVisitaDatabase instance = LugarVisitaDatabase._init();

  static Database? _database;

  LugarVisitaDatabase._init();

  Future<Database> get database async{
    if(_database != null){
      return _database!;
    }

    _database = await _initDB('lugarvisita.db');
    return _database!; //search for the meaning
  }

  Future<Database> _initDB(String rutaFichero) async{
    final dbPath = await getDatabasesPath();
    final ruta = join(dbPath,rutaFichero);

    return await openDatabase(ruta,version: 1,onCreate: _crearDB);
  }

  Future _crearDB(Database db,int version) async{
    //metodo para crear la base de datos
    //facilitar la concatenacion de los tipos de datos almacenandolos en variables
    final tipoId = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    final tipoNombre = 'TEXT NOT NULL';
    final tipoDescripcion = 'TEXT NOT NULL';
    final tipoCoordenada = 'TEXT NOT NULL';

    //ejecutamos la sentencia para realizar la creacion de la bd
    String sql ='''CREATE TABLE $nombretabla (
      ${CamposLugarVisita.id} $tipoId,
      ${CamposLugarVisita.nombre} $tipoNombre,
      ${CamposLugarVisita.descripcion} $tipoDescripcion,
      ${CamposLugarVisita.coordenada} $tipoCoordenada
      )
    ''';
    await db.execute(sql);
  }

   Future cerrar() async{
    final db = await instance.database;
    _database =null;
    //return db.close();
  }

  Future <LugarVisita> crearLugarVisita(LugarVisita lugarVisita) async{

    //otro methodo de añadir
    /*
    final json = luguarVisita.toJson();
    final columns = 
    '${CamposLugarVisita.nombre},${CamposLugarVisita.descripcion},${CamposLugarVisita.coordenada}';
    final values = 
    '${json[CamposLugarVisita.nombre]},${json[CamposLugarVisita.descripcion]},${json[CamposLugarVisita.coordenada]}';
    final db = await instance.database;
    final id = await db
      .rawInsert('INSERT INTO lugarvisita ($columns) VALUES ($values)');
    */
    final db = await instance.database;
    final id = await db.insert(nombretabla, lugarVisita.toJson());
    return lugarVisita.copy(id : id); //id autogenerado
    
  }

  
  Future <LugarVisita> obtenerLugarVisita(int id) async{
    final db = await instance.database;

    final mapas = await db.query(nombretabla,columns: CamposLugarVisita.valores,
    where : '${CamposLugarVisita.id} = ?',whereArgs: [id]);

    if(mapas.isNotEmpty){
      return LugarVisita.fromJson(mapas.first);
    }else{
      throw Exception('ID $id no encontrado');
    }
  } 

  Future <List<LugarVisita>> obtenerTodosLosLugarVisita() async{
    final db = await instance.database;
    final orderBy = '${CamposLugarVisita.nombre} ASC';
    //final res = await
      //db.query('SELECT * FROM $nombretabla ORDER BY $orderBy');
    final resultado = await db.query(nombretabla,orderBy: orderBy);
    print(resultado);

    //return resultado.map((datos) => LugarVisita.fromMap(datos)).toList();
    return resultado.map((json) => LugarVisita.fromJson(json)).toList();
  }
}