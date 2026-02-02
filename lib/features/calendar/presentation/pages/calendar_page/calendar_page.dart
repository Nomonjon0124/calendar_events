part of 'calendar_part.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> with CalendarMixin {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CalendarBloc, CalendarState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            centerTitle: true,
            title: _appBarTitle(state),
            actions: [
              Padding(padding: EdgeInsets.only(right: 16), child: SvgPicture.asset('assets/images/svg/ic_notification.svg', width: 28, height: 28)),
            ],
          ),
          body: Column(
            children: [
              SizedBox(height: 38),
              CalendarHeader(
                focusedMonth: state.focusedMonth,
                onLeftArrowTap: () {
                  _pageController.previousPage(duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
                },
                onRightArrowTap: () {
                  _pageController.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
                },
              ),
              const SizedBox(height: 20),
              CalendarMonthPager(
                anchorMonth: _anchorDate,
                focusedMonth: state.focusedMonth ?? DateTime.now(),
                selectedDate: state.selectedDate ?? DateTime.now(),
                controller: _pageController,
                monthEvents: state.events ?? [],
                onMonthChanged: (newMonth) {
                  context.read<CalendarBloc>().add(SetFocusedMonthEvent(newMonth));
                },
                onDaySelected: (date) {
                  context.read<CalendarBloc>().add(SetSelectedDateEvent(date));
                },
              ),
              const SizedBox(height: 20),
              _scheduleHeader(state),
              const SizedBox(height: 20),
              Flexible(
                child: Builder(
                  builder: (context) {
                    if (state.state == CalendarEnum.loading) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    if (state.state == CalendarEnum.success) {
                      if (state.events?.isEmpty ?? false) {
                        return const Center(child: Text('No events for this day', style: TextStyle(color: Colors.grey)));
                      }
                      return EventList(
                        events: state.selectDayEvents,
                        onTap: (int index) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder:
                                  (context) => BlocProvider(
                                    create:
                                        (context) => CalendarBloc(
                                          addEvent: sl<AddEvent>(),
                                          updateEvent: sl<UpdateEvent>(),
                                          deleteEvent: sl<DeleteEvent>(),
                                          getEvents: sl<GetEventsByDateRange>(),
                                        ),
                                    child: EventDetailPage(event: state.events?[index]),
                                  ),
                            ),
                          ).then((_) {
                            _loadEventsForSelectedDay();
                          });
                        },
                      );
                    }
                    return const SizedBox.shrink();
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
