import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:p11/latihan/models2/kabupaten.dart';

class DBHelper {
  static final DBHelper _instance = DBHelper._internal();
  factory DBHelper() => _instance;
  DBHelper._internal();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB();
    return _database!;
  }

  Future<Database> _initDB() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'riau_kabupaten.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE kabupaten(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            nama TEXT,
            logoUrl TEXT,
            pusatPemerintahan TEXT,
            bupati TEXT,
            luasWilayah TEXT,
            jumlahPenduduk INTEGER,
            jumlahKecamatan INTEGER,
            jumlahKelurahan INTEGER,
            jumlahDesa INTEGER,
            website TEXT
          )
        ''');
      },
    );
  }

  Future<int> insertKabupaten(Kabupaten kab) async {
    final db = await database;
    return await db.insert(
      'kabupaten',
      kab.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Kabupaten>> getAllKabupaten() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('kabupaten');

    return List.generate(maps.length, (i) {
      return Kabupaten.fromMap(maps[i]);
    });
  }
}
