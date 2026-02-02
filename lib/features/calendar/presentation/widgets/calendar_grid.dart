import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../domain/entities/event_entity.dart';

class CalendarGrid extends StatelessWidget {
  final DateTime month;
  final DateTime selectedDate;
  final ValueChanged<DateTime> onDaySelected;
  final List<EventEntity> monthEvents;

  const CalendarGrid({super.key, required this.month, required this.selectedDate, required this.onDaySelected, required this.monthEvents});

  List<EventEntity> eventsForDay(DateTime date) {
    return monthEvents.where((e) => e.startDate.year == date.year && e.startDate.month == date.month && e.startDate.day == date.day).toList();
  }

  List<Color> priorityDotsForDay(DateTime date) {
    final events = eventsForDay(date);
    final priorities = events.map((e) => e.priority).toSet();
    return priorities.map((p) => AppColors.priorityColor(p)).toList();
  }

  @override
  Widget build(BuildContext context) {
    final firstDay = DateTime(month.year, month.month, 1);
    final daysInMonth = DateTime(month.year, month.month + 1, 0).day;
    final int offset;
    if (firstDay.weekday == DateTime.monday) {
      offset = 0;
    } else {
      offset = firstDay.weekday - 1;
    }

    return Column(
      children: [
        _buildWeekDays(),
        SizedBox(height: 20),
        Expanded(
          child: GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: daysInMonth + offset,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 7,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              childAspectRatio: 0.8,
            ),
            itemBuilder: (_, index) {
              if (index < offset) return const SizedBox();

              final day = index - offset + 1;
              if (day < 1 || day > daysInMonth) return const SizedBox();
              final date = DateTime(month.year, month.month, day);
              final dayEventsColors = priorityDotsForDay(date);
              final isSelected = date.year == selectedDate.year && date.month == selectedDate.month && date.day == selectedDate.day;

              return GestureDetector(
                onTap: () {
                  onDaySelected(date);
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 32,
                      height: 32,
                      decoration: BoxDecoration(shape: BoxShape.circle, color: isSelected ? Colors.blue : Colors.transparent),
                      child: Center(
                        child: Text('$day', style: TextStyle(color: isSelected ? Colors.white : Colors.black, fontWeight: FontWeight.w500)),
                      ),
                    ),
                    const SizedBox(height: 4),
                    if (dayEventsColors.isNotEmpty)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:
                            dayEventsColors
                                .map((color) => Padding(padding: const EdgeInsets.only(right: 4), child: _containerCircle(color)))
                                .toList(),
                      ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  // Hafta kunlarini chizuvchi metod
  Widget _buildWeekDays() {
    // Hafta kunlari (Dushanba, Seshanba...)
    const weekDays = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children:
            weekDays.map((day) {
              return Expanded(child: Center(child: Text(day, style: const TextStyle(color: Colors.grey, fontSize: 12, fontWeight: FontWeight.bold))));
            }).toList(),
      ),
    );
  }

  Widget _containerCircle(Color color) {
    return Container(width: 4, height: 4, decoration: BoxDecoration(borderRadius: BorderRadius.circular(2), color: color));
  }
}
