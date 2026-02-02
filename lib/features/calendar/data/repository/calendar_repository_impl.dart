import '../../domain/entities/event_entity.dart';
import '../../domain/repository/calendar_repository.dart';
import '../datasources/calendar_local_datasource.dart';
import '../models/event_model.dart';

class CalendarRepositoryImpl implements CalendarRepository {
  final CalendarLocalDataSource localDataSource;

  CalendarRepositoryImpl(this.localDataSource);

  @override
  Future<int> addEvent(EventEntity event) {
    final model = EventModel.fromEntity(event);
    return localDataSource.addEvent(model);
  }

  @override
  Future<int> updateEvent(EventEntity event) {
    final model = EventModel.fromEntity(event);
    return localDataSource.updateEvent(model);
  }

  @override
  Future<int> deleteEvent(int id) {
    return localDataSource.deleteEvent(id);
  }

  @override
  Future<List<EventEntity>> getEventsByDateRange(DateTime start, DateTime end) async {
    final models = await localDataSource.getEventsByDateRange(start, end);
    return models;
  }
}
