part of '../calendar_part.dart';

mixin CalendarMixin on State<CalendarPage> {
  static const int _initialPage = 1200;
  late PageController _pageController;
  final DateTime _anchorDate = DateTime.now();

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _initialPage);
    _loadEventsForSelectedDay();
  }

  Widget _appBarTitle(CalendarState state) {
    return Column(
      children: [
        Text(DateFormat('EEEE').format(state.selectedDate ?? DateTime.now()), style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              DateFormat('dd MMMM yyyy').format(state.selectedDate ?? DateTime.now()),
              style: const TextStyle(color: Color(0xFF292929), fontSize: 10, fontWeight: FontWeight.w400),
            ),
            SizedBox(width: 4),
            SvgPicture.asset('assets/images/svg/arrow_down_outline.svg', fit: BoxFit.cover, width: 10, height: 10),
          ],
        ),
      ],
    );
  }

  void _loadEventsForSelectedDay([DateTime? date]) {
    final blocState = context.read<CalendarBloc>().state;
    final currentDate = date ?? blocState.selectedDate ?? DateTime.now();
    final start = DateTime(currentDate.year, currentDate.month, 1);
    final end = DateTime(currentDate.year, currentDate.month + 1, 1);

    context.read<CalendarBloc>().add(LoadEvents(start, end));
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Widget _scheduleHeader(CalendarState state) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text('Schedule', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Color(0xFF292929))),
          PrimaryButton(
            title: '+ Add Event',
            height: 30,
            backgroundColor: Color(0xFF009FEE),
            onTap: () {
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
                        child: AddEditEventPage(selectDate: state.selectedDate ?? DateTime.now()),
                      ),
                ),
              ).then((_) {
                context.read<CalendarBloc>().add(LoadMonthEvents(state.focusedMonth ?? DateTime.now()));
                _loadEventsForSelectedDay();
              });
            },
          ),
        ],
      ),
    );
  }
}
