import 'package:guideasy_app/model/PointOfInterest.dart';
import 'package:sqflite/sqlite_api.dart';

import 'AppDatabase.dart';

class POIDatabase extends AppDatabase {
  POIDatabase():super('pois.db', 'CREATE TABLE pois (id INTEGER PRIMARY KEY, latitude REAL, longitude REAL, title TEXT, description TEXT, icon TEXT)');

  saveNewPOIs(List<PointOfInterest> pois) async {
    await _deletePOIs();
    await _insertPOIs(pois);
  }

  Future<void> _insertPOIs(List<PointOfInterest> pois) async {
    for (PointOfInterest poi in pois) {
      await insertInDatabase('pois',
          poi.toMap(),
          conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
  }

  Future<void> _deletePOIs() async {
    final Database db = await this.getDatabase();
    await db.delete('pois');
  }

  Future<List<PointOfInterest>> getPOIs() async {
    final Database db = await this.getDatabase();

    final List<Map<String, dynamic>> maps = await db.query('pois');

    return List.generate(maps.length, (i) {
      return PointOfInterest(
        maps[i]['id'],
        maps[i]['longitude'],
        maps[i]['latitude'],
        maps[i]['title'],
        maps[i]['description'],
        maps[i]['icon']
      );
    });
  }

}