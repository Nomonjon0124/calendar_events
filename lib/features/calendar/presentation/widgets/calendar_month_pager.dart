import 'package:flutter/material.dart';

import '../../domain/entities/event_entity.dart';
import 'calendar_grid.dart';

class CalendarMonthPager extends StatelessWidget {
  final DateTime focusedMonth;
  final DateTime anchorMonth;
  final DateTime selectedDate;
  final PageController controller;
  final ValueChanged<DateTime> onMonthChanged;
  final ValueChanged<DateTime> onDaySelected;
  final int initialPage;
  final List<EventEntity> monthEvents;

  const CalendarMonthPager({
    super.key,
    required this.focusedMonth,
    required this.anchorMonth,
    required this.selectedDate,
    required this.controller,
    required this.onMonthChanged,
    required this.onDaySelected,
    this.initialPage = 1200,
    required this.monthEvents,
  });

  DateTime _monthFromIndex(int index) {
    final offset = index - initialPage;
    return DateTime(anchorMonth.year, anchorMonth.month + offset);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 360,
      child: PageView.builder(
        controller: controller,
        onPageChanged: (index) {
          onMonthChanged(_monthFromIndex(index));
        },
        itemBuilder: (_, index) {
          final month = _monthFromIndex(index);
          return CalendarGrid(
            month: month,
            selectedDate: selectedDate,
            onDaySelected: onDaySelected,
            monthEvents: monthEvents,
          );
        },
      ),
    );
  }
}
