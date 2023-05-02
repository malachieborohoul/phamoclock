import 'package:flutter/material.dart';
import 'package:phamoclock/common/widgets/custom_heading.dart';
import 'package:phamoclock/common/widgets/custom_rapport.dart';
import 'package:phamoclock/constants/colors.dart';
import 'package:phamoclock/constants/padding.dart';
import 'package:phamoclock/features/rapport/screens/details_rapport_screen.dart';

class AllRapportsScreen extends StatefulWidget {
  const AllRapportsScreen({
    super.key,
  });
  static const routeName = '/all-rapports-screen';

  @override
  State<AllRapportsScreen> createState() => _AllRapportsScreenState();
}

class _AllRapportsScreenState extends State<AllRapportsScreen> {
  TextEditingController travailEffectueController = TextEditingController();
  TextEditingController difficultesController = TextEditingController();
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(appPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomHeading(
                  title: "Derniers rapports", color: primary),
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
