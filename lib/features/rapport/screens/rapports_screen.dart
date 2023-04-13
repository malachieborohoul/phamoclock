import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:phamoclock/common/widgets/custom_button_box.dart';
import 'package:phamoclock/common/widgets/custom_heading.dart';
import 'package:phamoclock/common/widgets/custom_rapport.dart';
import 'package:phamoclock/common/widgets/custom_textfield_exigence.dart';
import 'package:phamoclock/constants/colors.dart';
import 'package:phamoclock/constants/padding.dart';
import 'package:phamoclock/features/rapport/screens/details_rapport_screen.dart';

class RapportsScreen extends StatefulWidget {
  const RapportsScreen({
    super.key,
  });
  static const routeName = '/rapports-screen';

  @override
  State<RapportsScreen> createState() => _RapportsScreenState();
}

class _RapportsScreenState extends State<RapportsScreen> {
  TextEditingController travailEffectueController = TextEditingController();
  TextEditingController difficultesController = TextEditingController();
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(appPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomHeading(
                  title: "Mes derniers rapports", color: primary),
              GestureDetector(
                  onTap: () => Navigator.pushNamed(
                      context, DetailsRapportScreen.routeName),
                  child: const CustomRapport(
                      date: "Mardi ", rapport: "Ok les gars")),
            ],
          ),
        ),
      ),
    );
  }
}
