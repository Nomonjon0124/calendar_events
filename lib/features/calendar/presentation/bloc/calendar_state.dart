part of 'calendar_bloc.dart';

class CalendarState extends Equatable {
  final CalendarEnum state;
  final List<EventEntity>? events;
  final List<EventEntity>? selectDayEvents;
  final String? errorMessage;
  final DateTime? selectedDate;
  final DateTime? focusedMonth;

  const CalendarState({
    this.events,
    this.selectDayEvents,
    this.errorMessage,
    this.state = CalendarEnum.initial,
    this.selectedDate,
    this.focusedMonth,
  });

  CalendarState copyWith({
    List<EventEntity>? events,
    List<EventEntity>? selectDayEvents,
    String? errorMessage,
    CalendarEnum? state,
    DateTime? selectedDate,
    DateTime? focusedMonth,
  }) {
    return CalendarState(
      events: events ?? this.events,
      selectDayEvents: selectDayEvents ?? this.selectDayEvents,
      errorMessage: errorMessage ?? this.errorMessage,
      state: state ?? this.state,
      selectedDate: selectedDate ?? this.selectedDate,
      focusedMonth: focusedMonth ?? this.focusedMonth,
    );
  }

  @override
  List<Object?> get props => [
    events,
    selectDayEvents,
    errorMessage,
    state,
    selectedDate,
    focusedMonth,
  ];
}
