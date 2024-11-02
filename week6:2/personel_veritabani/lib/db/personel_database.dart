import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/personel.dart';

class PersonelDatabase {
  static final PersonelDatabase instance = PersonelDatabase._init();

  static Database? _database;

  PersonelDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('personel.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE personel (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        ad TEXT NOT NULL,
        soyad TEXT NOT NULL,
        departman TEXT NOT NULL,
        maas INTEGER NOT NULL
      )
    ''');
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }

  Future<int> addPersonel(Personel personel) async {
    final db = await instance.database;
    return await db.insert('personel', personel.toMap());
  }

  Future<List<Personel>> getAllPersonel() async {
    final db = await instance.database;
    final result = await db.query('personel');
    return result.map((map) => Personel.fromMap(map)).toList();
  }

  Future<int> deletePersonel(int id) async {
    final db = await instance.database;
    return await db.delete('personel', where: 'id = ?', whereArgs: [id]);
  }
}
