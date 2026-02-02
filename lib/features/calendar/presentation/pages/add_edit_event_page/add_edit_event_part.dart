import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/enums/event_priority.dart';
import '../../../domain/entities/event_entity.dart';
import '../../bloc/calendar_bloc.dart';
import '../../widgets/custom_text_field.dart';
import '../../widgets/primary_button.dart';
import '../../widgets/validator/default_validator.dart';

part 'add_edit_event_page.dart';
part 'mixin/add_edit_event_mixin.dart';
