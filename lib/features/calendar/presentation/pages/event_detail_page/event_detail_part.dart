import 'package:calendar_events/features/calendar/presentation/pages/event_edit_page/event_edit_part.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/enums/event_priority.dart';
import '../../../../../di/injection_container.dart';
import '../../../domain/entities/event_entity.dart';
import '../../../domain/usecases/add_event.dart';
import '../../../domain/usecases/delete_event.dart';
import '../../../domain/usecases/get_events_by_date.dart';
import '../../../domain/usecases/update_event.dart';
import '../../bloc/calendar_bloc.dart';
import '../../widgets/custom_text_field.dart';
import '../../widgets/primary_button.dart';
import '../../widgets/validator/default_validator.dart';

part 'event_detail_page.dart';
part 'mixin/event_detail_mixin.dart';