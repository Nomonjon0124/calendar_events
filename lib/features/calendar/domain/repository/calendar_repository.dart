import '../entities/event_entity.dart';

abstract class CalendarRepository {
  Future<int> addEvent(EventEntity event);

  Future<int> updateEvent(EventEntity event);

  Future<int> deleteEvent(int id);

  Future<List<EventEntity>> getEventsByDateRange(DateTime start, DateTime end);
}
