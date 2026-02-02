import '../../domain/entities/event_entity.dart';
import '../../../../core/enums/event_priority.dart';

class EventModel extends EventEntity {
  const EventModel({
    super.id,
    required super.title,
    super.description,
    super.location,
    required super.startDate,
    required super.endDate,
    required super.priority,
  });

  factory EventModel.fromEntity(EventEntity entity) {
    return EventModel(
      id: entity.id,
      title: entity.title,
      description: entity.description,
      location: entity.location,
      startDate: entity.startDate,
      endDate: entity.endDate,
      priority: entity.priority,
    );
  }

  factory EventModel.fromMap(Map<String, dynamic> map) {
    return EventModel(
      id: map['id'] as int?,
      title: map['title'] as String,
      description: map['description'] as String?,
      location: map['location'] as String?,
      startDate:
      DateTime.fromMillisecondsSinceEpoch(map['start_date'] as int),
      endDate: DateTime.fromMillisecondsSinceEpoch(map['end_date'] as int),
      priority: EventPriority.values[map['priority'] as int],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'location': location,
      'start_date': startDate.millisecondsSinceEpoch,
      'end_date': endDate.millisecondsSinceEpoch,
      'priority': priority.index,
    };
  }
}
