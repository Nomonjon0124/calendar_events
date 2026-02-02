part of 'event_detail_part.dart';

class EventDetailPage extends StatefulWidget {
  final EventEntity? event;

  const EventDetailPage({super.key, required this.event});

  @override
  State<EventDetailPage> createState() => _EventDetailPageState();
}

class _EventDetailPageState extends State<EventDetailPage> with EventDetailMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 18),
          Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.symmetric(horizontal: 28, vertical: 18),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
              color: Color(0xFF009FEE),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        width: 40,
                        height: 40,
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colors.white),
                        child: SvgPicture.asset(
                          'assets/images/svg/arrow_left_outline.svg',
                          width: 24,
                          height: 24,
                          colorFilter: ColorFilter.mode(Colors.black, BlendMode.srcIn),
                        ),
                      ),
                    ),
                    GestureDetector(
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
                                  child: EventEditPage(event: widget.event),
                                ),
                          ),
                        ).then((value) {
                          if (mounted) {
                            final eventValue = value[0] as EventEntity;
                            event = eventValue;
                            setState(() {});
                          }
                        });
                      },
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            'assets/images/svg/ic_edit.svg',
                            width: 14,
                            height: 14,
                            colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
                          ),
                          SizedBox(width: 4),
                          Text("Edit", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.white)),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Text(event?.title ?? "", style: TextStyle(fontSize: 26, fontWeight: FontWeight.w600, color: Colors.white)),
                Text(event?.description ?? "", style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: Colors.white)),
                SizedBox(height: 12),
                Row(
                  children: [
                    SvgPicture.asset(
                      'assets/images/svg/ic_time.svg',
                      width: 18,
                      height: 18,
                      colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
                    ),
                    SizedBox(width: 4),
                    Text(
                      _dateInterval(event?.startDate, event?.endDate),
                      style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: Colors.white),
                    ),
                  ],
                ),
                SizedBox(height: 12),
                Row(
                  children: [
                    SvgPicture.asset(
                      'assets/images/svg/ic_location.svg',
                      width: 18,
                      height: 18,
                      colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
                    ),
                    SizedBox(width: 4),
                    Text(event?.location ?? "", style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: Colors.white)),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 28),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Reminder", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black)),
                SizedBox(height: 10),
                Text("15 minutes befor", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Color(0xFF7C7B7B))),
                SizedBox(height: 22),
                Text("Description", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black)),
                SizedBox(height: 10),
                Text(
                  """Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus vel ex sit amet neque dignissim mattis non eu est. Etiam pulvinar est mi, et porta magna accumsan nec. Ut vitae urna nisl. Integer gravida sollicitudin massa, ut congue orci posuere sit amet. Aenean laoreet egestas est, ut auctor nulla suscipit non. """,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Color(0xFF999999)),
                ),
              ],
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28.0, vertical: 18),
            child: PrimaryButton(
              title: 'Delete Event',
              fontSize: 16,
              icon: SvgPicture.asset('assets/images/svg/ic_delete.svg', width: 20, height: 20),
              fontColor: Color(0xFF292929),
              width: MediaQuery.of(context).size.width,
              fontWeight: FontWeight.w600,
              backgroundColor: Color(0xFFFEE8E9),
              onTap: () {
                context.read<CalendarBloc>().add(DeleteCalendarEvent(event?.id ?? 0));
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}
