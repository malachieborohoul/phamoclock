import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../constants/padding.dart';

class CustomSchedule extends StatefulWidget {
  final day;
  final arivalHour;
  final departureHour;
  final color;
  const CustomSchedule(
      {super.key,
      required this.day,
      required this.arivalHour,
      required this.departureHour,
      this.color = primary});

  @override
  State<CustomSchedule> createState() => _CustomScheduleState();
}

class _CustomScheduleState extends State<CustomSchedule> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: miniSpacer),
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: widget.color.withOpacity(0.1),
          border: Border(
            left: BorderSide(width: 5, color: widget.color),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(miniSpacer),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.day,
                style: const TextStyle(
                    fontSize: 17, fontWeight: FontWeight.bold, color: primary),
              ),
              Row(
                children: [
                  Text(
                    "${widget.arivalHour}-${widget.departureHour}",
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: widget.color),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
