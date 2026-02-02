import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

class CalendarHeader extends StatelessWidget {
  final DateTime? focusedMonth;
  final VoidCallback onLeftArrowTap;
  final VoidCallback onRightArrowTap;

  const CalendarHeader({
    super.key,
    required this.focusedMonth,
    required this.onLeftArrowTap,
    required this.onRightArrowTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 28.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            DateFormat('MMMM yyyy').format(focusedMonth??DateTime.now()),
            style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Color(0xFF292929)
            ),
          ),
          Row(
            children: [
              GestureDetector(
                onTap: onLeftArrowTap,
                child: Container(
                  height: 23,
                  width: 23,
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                      color: const Color(0xFFEFEFEF),
                      borderRadius: BorderRadius.circular(12)
                  ),
                  child: SvgPicture.asset(
                      'assets/images/svg/arrow_left_outline.svg',
                      fit: BoxFit.cover,
                      width: 15,
                      height: 15
                  ),
                ),
              ),
              const SizedBox(width: 10),
              GestureDetector(
                onTap: onRightArrowTap,
                child: Container(
                  height: 23,
                  width: 23,
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                      color: const Color(0xFFEFEFEF),
                      borderRadius: BorderRadius.circular(12)
                  ),
                  child: SvgPicture.asset(
                      'assets/images/svg/arrow_right_outline.svg',
                      fit: BoxFit.cover,
                      width: 15,
                      height: 15
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
