import 'package:equatable/equatable.dart';
import '../../../../core/enums/event_priority.dart';

class EventEntity extends Equatable {
  final int? id;
  final String title;
  final String? description;
  final String? location;
  final DateTime startDate;
  final DateTime endDate;
  final EventPriority priority;

  const EventEntity({
    this.id,
    required this.title,
    this.description,
    this.location,
    required this.startDate,
    required this.endDate,
    required this.priority,
  });

  @override
  List<Object?> get props => [
    id,
    title,
    description,
    location,
    startDate,
    endDate,
    priority,
  ];
}
