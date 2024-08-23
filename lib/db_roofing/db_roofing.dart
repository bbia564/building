
import 'package:construction_roofing/db_roofing/roofing_entity.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBRoofing extends GetxService {
  late Database dbBase;

  Future<DBRoofing> init() async {
    await createRoofingDB();
    return this;
  }

  createRoofingDB() async {
    var dbPath = await getDatabasesPath();
    String path = join(dbPath, 'roofing.db');

    dbBase = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
          await createRoofingTable(db);
        });
  }

  createRoofingTable(Database db) async {
    await db.execute(
        'CREATE TABLE IF NOT EXISTS roofing (id INTEGER PRIMARY KEY, createTime TEXT, type INTEGER, result TEXT)');
  }

  insertRoofing(RoofingEntity entity) async {
    final id = await dbBase.insert('roofing', {
      'createTime': entity.createTime.toIso8601String(),
      'type': entity.type,
      'result': entity.result,
    });
    return id;
  }

  cleanRoofingData() async {
    await dbBase.delete('roofing');
  }

  Future<List<RoofingEntity>> getAllData() async {
    var result = await dbBase.query('roofing', orderBy: 'createTime DESC');
    return result.map((e) => RoofingEntity.fromJson(e)).toList();
  }
}
