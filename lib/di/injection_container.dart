import 'package:get_it/get_it.dart';

import '../core/database/db_helper.dart';
import '../features/calendar/data/datasources/calendar_local_datasource.dart';
import '../features/calendar/data/datasources/calendar_local_datasource_impl.dart';
import '../features/calendar/data/repository/calendar_repository_impl.dart';
import '../features/calendar/domain/repository/calendar_repository.dart';
import '../features/calendar/domain/usecases/add_event.dart';
import '../features/calendar/domain/usecases/delete_event.dart';
import '../features/calendar/domain/usecases/get_events_by_date.dart';
import '../features/calendar/domain/usecases/update_event.dart';
import '../features/calendar/presentation/bloc/calendar_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerLazySingleton<DBHelper>(() => DBHelper());
  sl.registerLazySingleton<CalendarLocalDataSource>(() => CalendarLocalDataSourceImpl(sl()));
  sl.registerLazySingleton<CalendarRepository>(() => CalendarRepositoryImpl(sl()));
  sl.registerLazySingleton(() => AddEvent(sl()));
  sl.registerLazySingleton(() => UpdateEvent(sl()));
  sl.registerLazySingleton(() => DeleteEvent(sl()));
  sl.registerLazySingleton(() => GetEventsByDateRange(sl()));
  sl.registerFactory(() => CalendarBloc(addEvent: sl(), updateEvent: sl(), deleteEvent: sl(), getEvents: sl()));
}
