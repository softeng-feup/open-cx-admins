import 'package:guideasy_app/model/PointOfInterest.dart';
import 'package:sqflite/sqlite_api.dart';

import 'AppDatabase.dart';

class POIDatabase extends AppDatabase {
  POIDatabase():super('pointsofinterest.db', 'CREATE TABLE pointsofinterest (id INTEGER PRIMARY KEY, latitude REAL, longitude REAL, title TEXT, description TEXT, type TEXT, keyword TEXT)');

  saveNewPOIs(List<PointOfInterest> pois) async {
    await _deletePOIs();
    await _insertPOIs(pois);
  }

  Future<void> _insertPOIs(List<PointOfInterest> pois) async {
    for (PointOfInterest poi in pois) {
      await insertInDatabase('pointsofinterest',
          poi.toMap(),
          conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
  }

  Future<void> _deletePOIs() async {
    final Database db = await this.getDatabase();
    await db.delete('pointsofinterest');
  }

  Future<List<PointOfInterest>> getPOIs() async {
    final Database db = await this.getDatabase();

    final List<Map<String, dynamic>> maps = await db.query('pointsofinterest');

    return List.generate(maps.length, (i) {
      return PointOfInterest(
        maps[i]['id'],
        maps[i]['longitude'],
        maps[i]['latitude'],
        maps[i]['title'],
        maps[i]['description'],
        maps[i]['type'],
        maps[i]['keyword']
      );
    });
  }

}