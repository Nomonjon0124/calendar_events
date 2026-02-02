import 'package:intl/intl.dart';

import '../entities/event_entity.dart';
import '../repository/calendar_repository.dart';

class AddEvent {
  final CalendarRepository repository;

  AddEvent(this.repository);

  Future<int> call(EventEntity event) {
    return repository.addEvent(event);
  }
}
