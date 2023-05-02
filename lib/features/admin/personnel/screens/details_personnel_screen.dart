import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:phamoclock/common/animations/opacity_tween.dart';
import 'package:phamoclock/common/animations/slide_down_tween.dart';
import 'package:phamoclock/common/widgets/custom_app_bar.dart';
import 'package:phamoclock/common/widgets/custom_heading.dart';
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
    initializeDateFormatting('fr');


    return SafeArea(
      child: Scaffold(
        body: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            appBar: const PreferredSize(
              preferredSize: Size.fromHeight(40),
              child:  CustomAppBar(
                title: "Profil",
                backgroundColor: Colors.transparent,
                action: false,
              ),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(appPadding),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SlideDownTween(
                      offset: 25,
                      child: OpacityTween(
                        begin: 0.0,
                        child: Container(
                          width: 80,
                          height: 80,
                          decoration: const BoxDecoration(
                            color: primary,
                            borderRadius: BorderRadius.all(
                              Radius.circular(80),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: miniSpacer,
                    ),
                    const OpacityTween(
                      begin: 0.0,
                      child:  Text(
                        "Borohoul Malachie",
                        style: TextStyle(
                            color: secondary, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const OpacityTween(
                      begin: 0.0,
                      child:  Text(
                        "malachieborohoul",
                        style: TextStyle(
                            color: grey, fontWeight: FontWeight.normal),
                      ),
                    ),
                    const OpacityTween(
                      begin: 0.0,
                      child:  Text(
                        "123344555",
                        style: TextStyle(
                            color: textBlack, fontWeight: FontWeight.normal),
                      ),
                    ),
                    const SizedBox(
                      height: spacer,
                    ),
                    const OpacityTween(
                        begin: 0.0,
                        child:  CustomHeading(
                            title: "Horaires", color: primary)),
                    const SizedBox(
                      height: miniSpacer,
                    ),
                    const OpacityTween(
                      begin: 0.0,
                      child:  CustomSchedule(
                        day: "Aujourd'hui",
                        arivalHour: "8:00",
                        departureHour: "19:00",
                      ),
                    ),
                    const OpacityTween(
                      begin: 0.0,
                      child:  CustomSchedule(
                        day: "Aujourd'hui",
                        arivalHour: "8:00",
                        departureHour: "19:00",
                        color: third,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
