import '../entities/event_entity.dart';
import '../repository/calendar_repository.dart';

class GetEventsByDateRange {
  final CalendarRepository repository;

  GetEventsByDateRange(this.repository);

  Future<List<EventEntity>> call(DateTime start, DateTime end) {
    return repository.getEventsByDateRange(start, end);
  }
}
