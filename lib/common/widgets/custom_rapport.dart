import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../constants/padding.dart';

class CustomRapport extends StatefulWidget {
  final date;
  final rapport;

  const CustomRapport({
    super.key,
    required this.date,
    required this.rapport,
  });

  @override
  State<CustomRapport> createState() => _CustomRapportState();
}

class _CustomRapportState extends State<CustomRapport> {
  @override
  Widget build(BuildContext context) {
    return 
    Padding(
      padding: const EdgeInsets.only(bottom: miniSpacer),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            color: textWhite,
            border: Border.all(color: grey.withOpacity(0.2), width: 0.5),
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            ),
            boxShadow: [
              BoxShadow(
                  color: textBlack.withOpacity(0.12),
                  offset: Offset(0, 3),
                  blurRadius: 1),
            ]),
        child: Padding(
          padding: const EdgeInsets.all(miniSpacer),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.date,
                style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: textBlack),
              ),
              const SizedBox(
                height: miniSpacer,
              ),
              Text(
                "${widget.rapport}",
                style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: textBlack),
              )
            ],
          ),
        ),
      ),
    );
  }
}
