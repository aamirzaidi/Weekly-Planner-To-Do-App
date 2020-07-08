import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'constants.dart';


class DatabaseHelper{
  static final _dbName = 'myDatabase.db';
  static final _dbVersion = 1;
  static final SuntableName = days[0];
  static final MontableName = days[1];
  static final TuetableName = days[2];
  static final WedtableName = days[3];
  static final ThutableName = days[4];
  static final FritableName = days[5];
  static final SattableName = days[6];
  static final columnID = 'iD';
  static final columnNAME = 'name';
  static final columnISDONE = 'isDone';

  //making it a singleton class
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance  = DatabaseHelper._privateConstructor();
  static Database _database;
  Future<Database> get database async{
    if(_database!=null){
      return _database;
    }
    _database = await _initiateDatabase();
    return _database;
  }
  _initiateDatabase() async{
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path,_dbName);
    return await openDatabase(path,version: _dbVersion,onCreate: _onCreate);
  }
  Future _onCreate(Database db, int version){
    db.execute(
        '''
        CREATE TABLE $SuntableName(
        $columnID INTEGER PRIMARY KEY,    
        $columnNAME TEXT NOT NULL,
        $columnISDONE INTEGER)
        '''
    );

    db.execute(
        '''
        CREATE TABLE $MontableName(
        $columnID INTEGER PRIMARY KEY,    
        $columnNAME TEXT NOT NULL,
        $columnISDONE INTEGER)
        '''
    );

    db.execute(
        '''
        CREATE TABLE $TuetableName(
        $columnID INTEGER PRIMARY KEY,    
        $columnNAME TEXT NOT NULL,
        $columnISDONE INTEGER)
        '''
    );

    db.execute(
        '''
        CREATE TABLE $WedtableName(
        $columnID INTEGER PRIMARY KEY,    
        $columnNAME TEXT NOT NULL,
        $columnISDONE INTEGER)
        '''
    );

    db.execute(
        '''
        CREATE TABLE $ThutableName(
        $columnID INTEGER PRIMARY KEY,    
        $columnNAME TEXT NOT NULL,
        $columnISDONE INTEGER)
        '''
    );

    db.execute(
        '''
        CREATE TABLE $FritableName(
        $columnID INTEGER PRIMARY KEY,    
        $columnNAME TEXT NOT NULL,
        $columnISDONE INTEGER)
        '''
    );

    db.execute(
        '''
        CREATE TABLE $SattableName(
        $columnID INTEGER PRIMARY KEY,    
        $columnNAME TEXT NOT NULL,
        $columnISDONE INTEGER)
        '''
    );
  }

  String returnTableName(String selectedDay){
    if(selectedDay==days[0]){
      return SuntableName;
    }else if(selectedDay==days[1]){
      return MontableName;
    }else if(selectedDay==days[2]){
      return TuetableName;
    }else if(selectedDay==days[3]){
      return WedtableName;
    }else if(selectedDay==days[4]){
      return ThutableName;
    }else if(selectedDay==days[5]){
      return FritableName;
    }else if(selectedDay==days[6]){
      return SattableName;
    }
  }

  Future<int> insert(Map<String,dynamic> row,String selectedDay) async{
    Database db = await instance.database;
    String tableName = returnTableName(selectedDay);
    print(tableName);
    return await db.insert(tableName, row);
  }

  Future<List<Map<String,dynamic>>> queryAll(String tableName) async{
    Database db = await instance.database;
    return await db.query(tableName);
  }

  Future<List<Map<String,dynamic>>> queryAlltemp(String selectedDay) async{
    Database db = await instance.database;
    String tableName = returnTableName(selectedDay);
    return await db.query(tableName);
  }

  Future<int> deleteAll(String selectedDay) async{
    Database db = await instance.database;
    String tableName = returnTableName(selectedDay);
    for(int id =0; id<10 ; id ++){
      return await db.rawDelete('DELETE FROM $tableName');
    }
  }

  Future<int> deleteRaw(String name,String selectedDay) async{
    Database db = await instance.database;
    String tableName = returnTableName(selectedDay);
    String sql = 'DELETE FROM $tableName WHERE $columnNAME = ?' ;
    return await db.rawDelete(sql , [name]);
  }
  Future<int> updateByName(String name, bool isDone,String selectedDay ) async{
    Database db =await instance.database;
    String tableName = returnTableName(selectedDay);
    int isDoneInteger ;
    if(isDone == true){
      isDoneInteger =0;
    }else if(isDone ==false){
      isDoneInteger = 1;
    }
    String sql = 'UPDATE $tableName SET $columnISDONE = ? WHERE $columnNAME = ?';
    return await db.rawUpdate(sql, [isDoneInteger,name]);
  }
}
