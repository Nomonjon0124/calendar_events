part of '../event_detail_part.dart';

mixin EventDetailMixin on State<EventDetailPage> {

  EventEntity? event;

  @override
  void initState() {
    super.initState();
    if (widget.event != null) {
      event = widget.event!;
    }
  }

  String _dateInterval(DateTime? startDate, DateTime? endDate) {
    final start =DateFormat('HH:mm').format(startDate??DateTime.now());
    final end =DateFormat('HH:mm').format(endDate??DateTime.now());
    return '$start - $end';
  }
}
