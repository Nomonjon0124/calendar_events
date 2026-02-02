import '../repository/calendar_repository.dart';

class DeleteEvent {
  final CalendarRepository repository;

  DeleteEvent(this.repository);

  Future<int> call(int id) {
    return repository.deleteEvent(id);
  }
}
