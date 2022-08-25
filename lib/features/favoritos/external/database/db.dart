import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DB {
  DB._();

  static final DB instance = DB._();

  static Database? _database;

  get database async {
    if (_database != null) {
      return _database;
    }
    return await _initDatabase();
  }
  get deletarDatabase async {
    return await _deleteDatabase();
  }
  _deleteDatabase() async {
    _database = null;
    return await deleteDatabase(join(await getDatabasesPath(), 'listagemGeek.db'));
  }

  _initDatabase() async {
    return await openDatabase(
      join(await getDatabasesPath(), 'listagemGeek.db'),
      version: 1,
      onCreate: _onCreate,
    );
  }
  _onCreate(db, versao) async {
    await db.execute(_favoritosFilme);
    await db.execute(_favoritosPersonagem);
  }

  String get _favoritosFilme => '''
  CREATE TABLE favoritos_filme (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    episode_id INTEGER,
    title TEXT,
    opening_crawl TEXT,
    director TEXT,
    producer TEXT,
    release_date TEXT
    
  );
  ''';
  String get _favoritosPersonagem => '''
  CREATE TABLE favoritos_personagem (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT,
    gender TEXT
  );
  ''';

}