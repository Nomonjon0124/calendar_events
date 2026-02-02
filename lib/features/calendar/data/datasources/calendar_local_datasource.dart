import '../models/event_model.dart';

abstract class CalendarLocalDataSource {
  Future<int> addEvent(EventModel event);

  Future<List<EventModel>> getEventsByDateRange(DateTime start, DateTime end);

  Future<int> updateEvent(EventModel event);

  Future<int> deleteEvent(int id);
}
