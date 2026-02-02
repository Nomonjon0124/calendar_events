import 'package:calendar_events/features/calendar/presentation/widgets/calendar_month_pager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

import '../../../../../core/enums/enum.dart';
import '../../../../../di/injection_container.dart';
import '../../../domain/usecases/add_event.dart';
import '../../../domain/usecases/delete_event.dart';
import '../../../domain/usecases/get_events_by_date.dart';
import '../../../domain/usecases/update_event.dart';
import '../../bloc/calendar_bloc.dart';
import '../../widgets/calendar_header.dart';
import '../../widgets/event_list.dart';
import '../../widgets/primary_button.dart';
import '../add_edit_event_page/add_edit_event_part.dart';
import '../event_detail_page/event_detail_part.dart';
import '../event_edit_page/event_edit_part.dart';

part 'calendar_page.dart';
part 'mixin/calendar_mixin.dart';
