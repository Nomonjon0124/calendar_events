part of 'calendar_bloc.dart';

abstract class CalendarEvent extends Equatable {
  const CalendarEvent();

  @override
  List<Object?> get props => [];
}

class LoadEvents extends CalendarEvent {
  final DateTime start;
  final DateTime end;

  const LoadEvents(this.start, this.end);

  @override
  List<Object?> get props => [start, end];
}

class LoadMonthEvents extends CalendarEvent {
  final DateTime month;

  const LoadMonthEvents(this.month);
}

class AddCalendarEvent extends CalendarEvent {
  final EventEntity event;

  const AddCalendarEvent(this.event);

  @override
  List<Object?> get props => [event];
}

class UpdateCalendarEvent extends CalendarEvent {
  final EventEntity event;

  const UpdateCalendarEvent(this.event);

  @override
  List<Object?> get props => [event];
}

class DeleteCalendarEvent extends CalendarEvent {
  final int id;

  const DeleteCalendarEvent(this.id);

  @override
  List<Object?> get props => [id];
}

class SetSelectedDateEvent extends CalendarEvent {
  final DateTime date;

  const SetSelectedDateEvent(this.date);
}

class SetFocusedMonthEvent extends CalendarEvent {
  final DateTime month;

  const SetFocusedMonthEvent(this.month);
}
