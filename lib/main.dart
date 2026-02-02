import 'package:calendar_events/features/calendar/domain/usecases/add_event.dart';
import 'package:calendar_events/features/calendar/domain/usecases/delete_event.dart';
import 'package:calendar_events/features/calendar/domain/usecases/get_events_by_date.dart';
import 'package:calendar_events/features/calendar/domain/usecases/update_event.dart';
import 'package:calendar_events/features/calendar/presentation/bloc/calendar_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'di/injection_container.dart';
import 'features/calendar/presentation/pages/calendar_page/calendar_part.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: BlocProvider(
        create:
            (context) =>
                CalendarBloc(
                    addEvent: sl<AddEvent>(),
                    updateEvent: sl<UpdateEvent>(),
                    deleteEvent: sl<DeleteEvent>(),
                    getEvents: sl<GetEventsByDateRange>(),
                  )
                  ..add(LoadMonthEvents(DateTime.now())),
        child: CalendarPage(),
      ),
    );
  }
}
