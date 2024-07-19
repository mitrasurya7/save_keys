import '../database/db_helper.dart';
import '../models/keynotes_model.dart';

class KeynotesRepository {
  final DatabaseHelper _databaseHelper = DatabaseHelper();

  Future<int> insertKeynotes(KeynotesModel keynotes) async {
    final db = await _databaseHelper.database;
    return await db.insert('Keynotes', keynotes.toMap());
  }

  Future<List<KeynotesModel>> getKeynotess() async {
    final db = await _databaseHelper.database;
    final List<Map<String, dynamic>> maps = await db.query('Keynotes');

    return List.generate(maps.length, (i) {
      return KeynotesModel.fromMap(maps[i]);
    });
  }

  Future<int> updateKeynotes(KeynotesModel keynotes) async {
    final db = await _databaseHelper.database;
    return await db.update(
      'Keynotes',
      keynotes.toMap(),
      where: 'id = ?',
      whereArgs: [keynotes.id],
    );
  }

  Future<int> deleteKeynotes(int id) async {
    final db = await _databaseHelper.database;
    return await db.delete(
      'Keynotes',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
