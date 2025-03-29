// import 'dart:typed_data';
// import 'package:sqflite/sqflite.dart';
// import 'package:path/path.dart';

// class DatabaseHelper {
//   static final DatabaseHelper instance = DatabaseHelper._init();
//   static Database? _database;

//   DatabaseHelper._init();

//   Future<Database> get database async {
//     if (_database != null) return _database!;
//     _database = await _initDB('players.db');
//     return _database!;
//   }

//   Future<Database> _initDB(String filePath) async {
//     final dbPath = await getDatabasesPath();
//     final path = join(dbPath, filePath);

//     return await openDatabase(
//       path,
//       version: 1,
//       onCreate: (db, version) async {
//         await db.execute('''
//           CREATE TABLE players (
//             id INTEGER PRIMARY KEY AUTOINCREMENT,
//             name TEXT NOT NULL,
//             age INTEGER NOT NULL,
//             image BLOB
//           )
//         ''');
//       },
//     );
//   }

//   Future<int> insertPlayer({
//     required String name,
//     required int age,
//     Uint8List? imageBytes,
//   }) async {
//     final db = await instance.database;
//     return await db.insert('players', {
//       'name': name,
//       'age': age,
//       'image': imageBytes,
//     });
//   }

//   Future<int> updatePlayerImage(int playerId, Uint8List imageBytes) async {
//     final db = await instance.database;
//     return await db.update(
//       'players',
//       {'image': imageBytes},
//       where: 'id = ?',
//       whereArgs: [playerId],
//     );
//   }

//   Future<Uint8List?> getImageById(int playerId) async {
//     final db = await instance.database;
//     final List<Map<String, dynamic>> result = await db.query(
//       'players',
//       columns: ['image'],
//       where: 'id = ?',
//       whereArgs: [playerId],
//     );

//     if (result.isNotEmpty && result.first['image'] != null) {
//       return result.first['image'] as Uint8List;
//     }
//     return null;
//   }

//   Future<List<Map<String, dynamic>>> getAllPlayers() async {
//     final db = await instance.database;
//     return await db.query('players');
//   }

//   Future<int> deletePlayer(int playerId) async {
//     final db = await instance.database;
//     return await db.delete(
//       'players',
//       where: 'id = ?',
//       whereArgs: [playerId],
//     );
//   }
// }
