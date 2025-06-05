import 'package:belajar_flutter/study_case/model/siswa_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  static Future<Database> db() async {
    final dbPath = await getDatabasesPath();
    return openDatabase(
      version: 2,
      onUpgrade: (db, oldVersion, newVersion) {
        return db.execute(
          'CREATE TABLE siswi(id INTEGER PRIMARY KEY AUTOINCREMENT, nama TEXT, umur TEXT)',
        );
      },

      join(dbPath, 'siswa_db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE siswa(id INTEGER PRIMARY KEY AUTOINCREMENT, nama TEXT, umur TEXT)',
        );
      },
    );
  }

  // fungsi create
  static Future<void> insertSiswa(Siswa siswa) async {
    final db = await DBHelper.db();

    await db.insert(
      'siswi',
      siswa.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    print("User registered successfully");
  }

  // fungsi get
  static Future<List<Siswa>> getAllSiswa() async {
    final db = await DBHelper.db();
    final List<Map<String, dynamic>> maps = await db.query('siswi');

    return List.generate(maps.length, (i) => Siswa.fromMap(maps[i]));
  }
}
