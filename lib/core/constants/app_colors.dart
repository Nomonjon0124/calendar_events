import 'package:flutter/material.dart';

import '../enums/event_priority.dart';

class AppColors {
  static Color priorityColor(EventPriority priority) {
    switch (priority) {
      case EventPriority.low:
        return Color(0xFF009FEE);
      case EventPriority.medium:
        return Color(0xFFEE8F00);
      case EventPriority.high:
        return Color(0xFFEE2B00);
    }
  }
}
