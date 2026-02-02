import '../entities/event_entity.dart';
import '../repository/calendar_repository.dart';

class UpdateEvent {
  final CalendarRepository repository;

  UpdateEvent(this.repository);

  Future<int> call(EventEntity event) {
    return repository.updateEvent(event);
  }
}
