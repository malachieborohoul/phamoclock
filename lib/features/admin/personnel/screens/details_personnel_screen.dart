import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:phamoclock/common/widgets/custom_app_bar.dart';
import 'package:phamoclock/common/widgets/custom_button_box.dart';
import 'package:phamoclock/common/widgets/custom_heading.dart';
import 'package:phamoclock/common/widgets/custom_rapport.dart';
import 'package:phamoclock/common/widgets/custom_textfield_exigence.dart';
import 'package:phamoclock/constants/colors.dart';
import 'package:phamoclock/constants/padding.dart';

import '../../../../common/widgets/custom_schedule.dart';

class DetailsPersonnelScreen extends StatefulWidget {
  const DetailsPersonnelScreen({
    super.key,
  });
  static const routeName = '/details-personnel-screen';

  @override
  State<DetailsPersonnelScreen> createState() => _DetailsPersonnelScreenState();
}

class _DetailsPersonnelScreenState extends State<DetailsPersonnelScreen> {
  TextEditingController travailEffectueController = TextEditingController();
  TextEditingController difficultesController = TextEditingController();
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: const PreferredSize(
          child: const CustomAppBar(
            title: "Profil",
            backgroundColor: Colors.transparent,
            action: false,
          ),
          preferredSize: Size.fromHeight(40),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(appPadding),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 80,
                  height: 80,
                  decoration: const BoxDecoration(
                    color: primary,
                    borderRadius: BorderRadius.all(
                      Radius.circular(80),
                    ),
                  ),
                ),
                const SizedBox(
                  height: miniSpacer,
                ),
                Text(
                  "Borohoul Malachie",
                  style:
                      TextStyle(color: secondary, fontWeight: FontWeight.bold),
                ),
                Text(
                  "malachieborohoul",
                  style: TextStyle(color: grey, fontWeight: FontWeight.normal),
                ),
                Text(
                  "123344555",
                  style: TextStyle(
                      color: textBlack, fontWeight: FontWeight.normal),
                ),
                const SizedBox(
                  height: spacer,
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
          ),
        ),
      ),
    );
  }
}
