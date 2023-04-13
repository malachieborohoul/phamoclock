import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:phamoclock/common/widgets/custom_dashborad_card.dart';
import 'package:phamoclock/common/widgets/custom_heading.dart';
import 'package:phamoclock/common/widgets/custom_schedule.dart';
import 'package:phamoclock/constants/colors.dart';
import 'package:phamoclock/constants/padding.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: getDashborad());
  }
}

Widget getHome() {
  return SingleChildScrollView(
    padding: EdgeInsets.all(appPadding),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.menu_outlined)),
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                  color: primary, borderRadius: BorderRadius.circular(14)),
            ),
          ],
        ),
        const SizedBox(
          height: spacer,
        ),
        Row(
          children: [
            Text(
              "Salut Borohoul!",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: secondary.withOpacity(1)),
            ),
          ],
        ),
        const SizedBox(
          height: miniSpacer,
        ),
        const Text(
          "Bienvenue sur ton espace de présences",
          style:
              TextStyle(fontSize: 20, fontWeight: FontWeight.w400, color: grey),
        ),
        const SizedBox(
          height: spacer,
        ),
        CustomHeading(title: "Horaires", color: primary),
        const SizedBox(
          height: miniSpacer,
        ),
        const CustomSchedule(
          day: "Aujourd'hui",
          arivalHour: "8:00",
          departureHour: "19:00",
        ),
        const CustomSchedule(
          day: "Aujourd'hui",
          arivalHour: "8:00",
          departureHour: "19:00",
          color: third,
        ),
      ],
    ),
  );
}

Widget getDashborad() {
  return SingleChildScrollView(
    padding: EdgeInsets.all(appPadding),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.menu_outlined)),
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                  color: primary, borderRadius: BorderRadius.circular(14)),
            ),
          ],
        ),
        const SizedBox(
          height: spacer,
        ),
        Row(
          children: [
            Text(
              "Salut Admin!",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: secondary.withOpacity(1)),
            ),
          ],
        ),
        const SizedBox(
          height: spacer,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            CustomDashboardCard(
              color: primary,
              icon: Icons.people_rounded,
              name: "Personnel",
              number: "4",
            ),
            CustomDashboardCard(
              color: secondary,
              icon: Icons.book_rounded,
              name: "Rapports non lus",
              number: "1",
            ),
          ],
        ),
        const SizedBox(
          height: miniSpacer,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            CustomDashboardCard(
              color: third,
              icon: Icons.lock_person_rounded,
              name: "Administrateurs",
              number: "3",
            ),
            CustomDashboardCard(
              color: orange,
              icon: Icons.calendar_month,
              name: "Rapports non lus",
              number: "1",
            ),
          ],
        ),
        const SizedBox(
          height: miniSpacer,
        ),
        const CustomHeading(title: "Horaires", color: primary),
        const SizedBox(
          height: miniSpacer,
        ),
        const CustomSchedule(
          day: "Aujourd'hui",
          arivalHour: "8:00",
          departureHour: "19:00",
        ),
        const CustomSchedule(
          day: "Aujourd'hui",
          arivalHour: "8:00",
          departureHour: "19:00",
          color: third,
        ),
      ],
    ),
  );
}
