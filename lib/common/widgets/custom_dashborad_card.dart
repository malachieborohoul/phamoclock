import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../constants/padding.dart';

class CustomDashboardCard extends StatefulWidget {
  const CustomDashboardCard(
      {super.key, required this.icon, required this.name, required this.number, required this.color});
  final IconData icon;
  final String name;
  final String number;
  final Color color;

  @override
  State<CustomDashboardCard> createState() => _CustomDashboardCardState();
}

class _CustomDashboardCardState extends State<CustomDashboardCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170,
      height: 170,
      decoration: BoxDecoration(
        color: widget.color.withOpacity(0.1),
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(miniSpacer),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              widget.icon,
              color: widget.color,
            ),
            Text(
              widget.name,
              style: const TextStyle(
                  fontSize: 15, fontWeight: FontWeight.bold, color: grey),
            ),
            Text(
              widget.number,
              style: const TextStyle(
                  fontSize: 35, fontWeight: FontWeight.bold, color: textBlack),
            ),
            const Icon(
              Icons.arrow_forward_rounded,
              color: textBlack,
            ),
          ],
        ),
      ),
    );
  }
}
