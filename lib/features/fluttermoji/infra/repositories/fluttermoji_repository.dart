import 'package:sqflite/sqflite.dart';

import '../../../../global/external/database/db.dart';

class FluttermojiRepository {
  late Database? db;
  String _fluttermojiData = '';
  String get fluttermojiData => _fluttermojiData;

  FluttermojiRepository() {
    _initRepository();
  }

  _initRepository() async {
    await _getFluttermojiData();
  }

  _getFluttermojiData() async {
    db = await DB.instance.database;
    List fluttermoji = await db!.query('fluttermoji_data', where: 'id = ?', whereArgs: [1]);
    List fluttermojiString = List.from(fluttermoji.map((e) => e['fluttermoji']));
    _fluttermojiData = fluttermojiString[0];
  }

  setFluttermojiData (String fluttermoji) async {
    db = await DB.instance.database;
    db!.update('fluttermoji_data', {
      'fluttermoji' : fluttermoji
    });
    _fluttermojiData = fluttermoji;
  }
}