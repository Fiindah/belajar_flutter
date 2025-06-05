import 'package:belajar_flutter/tugas11/model/model_jadwal.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBHelperDaftar {
  static Future<Database> db() async {
    final dbPath = await getDatabasesPath();
    return openDatabase(
      version: 1,
      join(dbPath, 'jadwal_db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE jadwal(id INTEGER PRIMARY KEY AUTOINCREMENT, asal TEXT, tujuan TEXT, tanggal TEXT, jam TEXT)',
        );
      },
    );
  }

  // fungsi create
  static Future<void> insertJadwal(ModelJadwal jadwal) async {
    final db = await DBHelperDaftar.db();

    await db.insert(
      'jadwal',
      jadwal.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    print("berhasil");
  }

  // fungsi get
  static Future<List<ModelJadwal>> getAllDaftar() async {
    final db = await DBHelperDaftar.db();
    final List<Map<String, dynamic>> maps = await db.query('jadwal');

    return List.generate(maps.length, (i) => ModelJadwal.fromMap(maps[i]));
  }
}
