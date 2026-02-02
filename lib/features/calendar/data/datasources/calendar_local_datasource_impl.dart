import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart';

import '../../../../core/database/db_helper.dart';
import '../../../../core/database/tables.dart';
import '../models/event_model.dart';
import 'calendar_local_datasource.dart';

class CalendarLocalDataSourceImpl implements CalendarLocalDataSource {
  final DBHelper dbHelper;

  CalendarLocalDataSourceImpl(this.dbHelper);

  @override
  Future<int> addEvent(EventModel event) async {
    print("event ${event.toMap()}");
    print("event date ${DateFormat('yyyy-MM-dd HH:mm:ss').format(event.startDate)}");
    final db = await dbHelper.database;
    return await db.insert(Tables.events, event.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
  }

  @override
  Future<List<EventModel>> getEventsByDateRange(DateTime start, DateTime end) async {
    final db = await dbHelper.database;

    final result = await db.query(
      Tables.events,
      where: 'start_date >= ? AND end_date <= ?',
      whereArgs: [start.millisecondsSinceEpoch, end.millisecondsSinceEpoch],
      orderBy: 'start_date ASC',
    );

    return result.map(EventModel.fromMap).toList();
  }

  @override
  Future<int> updateEvent(EventModel event) async {
    final db = await dbHelper.database;

    return await db.update(Tables.events, event.toMap(), where: 'id = ?', whereArgs: [event.id]);
  }

  @override
  Future<int> deleteEvent(int id) async {
    final db = await dbHelper.database;

    return await db.delete(Tables.events, where: 'id = ?', whereArgs: [id]);
  }
}
