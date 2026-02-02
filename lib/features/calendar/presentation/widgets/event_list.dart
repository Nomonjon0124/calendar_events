import 'package:flutter/material.dart';

import '../../domain/entities/event_entity.dart';
import 'event_card.dart';

class EventList extends StatelessWidget {
  final List<EventEntity>? events;
  final Function(int) onTap;

  const EventList({super.key, required this.events, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: events?.length,
      itemBuilder: (_, index) {
        return GestureDetector(
          onTap: () {
            onTap(index);
          },
          child: EventCard(event: events?[index]),
        );
      },
    );
  }
}
