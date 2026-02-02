import 'package:bloc/bloc.dart';
import 'package:calendar_events/core/enums/enum.dart';
import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';

import '../../domain/entities/event_entity.dart';
import '../../domain/usecases/add_event.dart';
import '../../domain/usecases/delete_event.dart';
import '../../domain/usecases/get_events_by_date.dart';
import '../../domain/usecases/update_event.dart';

part 'calendar_event.dart';
part 'calendar_state.dart';

class CalendarBloc extends Bloc<CalendarEvent, CalendarState> {
  final AddEvent addEvent;
  final UpdateEvent updateEvent;
  final DeleteEvent deleteEvent;
  final GetEventsByDateRange getEvents;

  CalendarBloc({required this.addEvent, required this.updateEvent, required this.deleteEvent, required this.getEvents})
    : super(CalendarState(selectedDate: DateTime.now(), focusedMonth: DateTime.now())) {
    on<LoadEvents>(_onLoadEvents);
    on<LoadMonthEvents>(_onLoadMonthEvents);
    on<AddCalendarEvent>(_onAddEvent);
    on<UpdateCalendarEvent>(_onUpdateEvent);
    on<DeleteCalendarEvent>(_onDeleteEvent);
    on<SetSelectedDateEvent>((event, emit) async {
      emit(state.copyWith(selectedDate: event.date));
      final start = DateTime(event.date.year, event.date.month, 1);
      final end = DateTime(event.date.year, event.date.month + 1, 1);
      final events = await getEvents(start, end);
      final selectDayEvents =
          events.where((e) => DateFormat('yyyy-MM-dd').format(e.startDate) == DateFormat('yyyy-MM-dd').format(event.date)).toList();
      emit(state.copyWith(events: events, selectDayEvents: selectDayEvents, state: CalendarEnum.success, selectedDate: event.date));
    });
    on<SetFocusedMonthEvent>((event, emit) async{
      final events = await getEvents(DateTime(event.month.year, event.month.month,1), DateTime(event.month.year,event.month.month+1,1));
      emit(state.copyWith(focusedMonth: event.month, events: events));
    });
  }

  Future<void> _onLoadEvents(LoadEvents event, Emitter<CalendarState> emit) async {
    emit(state.copyWith(state: CalendarEnum.loading));
    try {
      final events = await getEvents(event.start, event.end);
      final selectDayEvents =
          events
              .where((e) => DateFormat('yyyy-MM-dd').format(e.startDate) == DateFormat('yyyy-MM-dd').format(state.selectedDate ?? DateTime.now()))
              .toList();
      emit(state.copyWith(state: CalendarEnum.success, events: events, selectDayEvents: selectDayEvents));
    } catch (e) {
      emit(state.copyWith(state: CalendarEnum.error, errorMessage: e.toString()));
    }
  }

  _onLoadMonthEvents(LoadMonthEvents event, Emitter<CalendarState> emit) async {
    emit(state.copyWith(state: CalendarEnum.loading));

    final start = DateTime(event.month.year, event.month.month, 1);
    final end = DateTime(event.month.year, event.month.month + 1, 1);

    final events = await getEvents(start, end);
    final selectDayEvents =
        events
            .where((e) => DateFormat('yyyy-MM-dd').format(e.startDate) == DateFormat('yyyy-MM-dd').format(state.selectedDate ?? DateTime.now()))
            .toList();
    emit(state.copyWith(events: events, selectDayEvents: selectDayEvents, state: CalendarEnum.success));
  }

  Future<void> _onAddEvent(AddCalendarEvent event, Emitter<CalendarState> emit) async {
    await addEvent(event.event);
  }

  Future<void> _onUpdateEvent(UpdateCalendarEvent event, Emitter<CalendarState> emit) async {
    await updateEvent(event.event);
  }

  Future<void> _onDeleteEvent(DeleteCalendarEvent event, Emitter<CalendarState> emit) async {
    await deleteEvent(event.id);
  }
}
