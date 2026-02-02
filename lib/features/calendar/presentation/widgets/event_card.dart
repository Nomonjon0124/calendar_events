import 'package:calendar_events/core/enums/event_priority.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

import '../../../../core/constants/app_colors.dart';
import '../../domain/entities/event_entity.dart';

class EventCard extends StatelessWidget {
  final EventEntity? event;

  const EventCard({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    final time = '${DateFormat.Hm().format(event?.startDate??DateTime.now())} - ${DateFormat.Hm().format(event?.endDate??DateTime.now())}';

    return Container(
      margin: const EdgeInsets.only(left: 28, bottom: 14, right: 28),
      decoration: BoxDecoration(color: AppColors.priorityColor(event?.priority??EventPriority.medium).withOpacity(0.5), borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 10,
            decoration: BoxDecoration(
              color: AppColors.priorityColor(event?.priority??EventPriority.medium),
              borderRadius: const BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(event?.title??"", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: AppColors.priorityColor(event?.priority??EventPriority.medium))),
                Text(
                  event?.description ?? "",
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: AppColors.priorityColor(event?.priority??EventPriority.medium)),
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    SvgPicture.asset(
                      'assets/images/svg/ic_time.svg',
                      width: 16,
                      height: 16,
                      colorFilter: ColorFilter.mode(AppColors.priorityColor(event?.priority??EventPriority.high), BlendMode.srcIn),
                    ),
                    SizedBox(width: 4),
                    Text(time, style: TextStyle(fontSize: 10, fontWeight: FontWeight.w400, color: AppColors.priorityColor(event?.priority??EventPriority.medium))),
                    SizedBox(width: 10),
                    SvgPicture.asset(
                      'assets/images/svg/ic_location.svg',
                      width: 16,
                      height: 16,
                      colorFilter: ColorFilter.mode(AppColors.priorityColor(event?.priority??EventPriority.medium), BlendMode.srcIn),
                    ),
                    SizedBox(width: 4),
                    Text(event?.location ?? ""),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
