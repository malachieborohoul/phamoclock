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

class DetailsRapportScreen extends StatefulWidget {
  const DetailsRapportScreen({
    super.key,
  });
  static const routeName = '/details-rapports-screen';

  @override
  State<DetailsRapportScreen> createState() => _DetailsRapportScreenState();
}

class _DetailsRapportScreenState extends State<DetailsRapportScreen> {
  TextEditingController travailEffectueController = TextEditingController();
  TextEditingController difficultesController = TextEditingController();
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: PreferredSize(
          child: CustomAppBar(
            backgroundColor: Colors.transparent,
            action: false,
          ),
          preferredSize: Size.fromHeight(40),
        ),
        body: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.all(appPadding),
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
                children: const [
                  Text(
                    "Mardi",
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: textBlack),
                  ),
                  SizedBox(
                    height: miniSpacer,
                  ),
                  Text(
                    "By default, the shadow is solid black with zero [offset], zero [blurRadius], zero [spreadRadius], and [BlurStyle.normal].",
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.normal,
                        color: textBlack),
                  ),
                  SizedBox(
                    height: miniSpacer,
                  ),
                  Text(
                    "Difficultés rencontrées",
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: textBlack),
                  ),
                  SizedBox(
                    height: miniSpacer,
                  ),
                  Text(
                    "By default, the shadow is solid black with zero [offset], zero [blurRadius], zero [spreadRadius], and [BlurStyle.normal].",
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.normal,
                        color: textBlack),
                  ),
                ],
              ),
            ),
          ),
        )),
      ),
    );
  }
}
