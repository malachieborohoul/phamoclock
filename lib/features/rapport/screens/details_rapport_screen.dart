import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:phamoclock/common/widgets/custom_app_bar.dart';
import 'package:phamoclock/constants/colors.dart';
import 'package:phamoclock/constants/padding.dart';

class DetailsRapportScreen extends StatefulWidget {
  final   rapport;
  const DetailsRapportScreen({
    super.key,
    required this.rapport,
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

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(40),
          child: CustomAppBar(
            backgroundColor: Colors.transparent,
            action: false,
            title: "Rapport",
          ),
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
                      offset: const Offset(0, 3),
                      blurRadius: 1),
                ]),
            child: Padding(
              padding: const EdgeInsets.all(miniSpacer),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    " ${DateFormat.MMMEd().format(widget.rapport['createdAt'].toDate())}",
                    style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: textBlack),
                  ),
                  const SizedBox(
                    height: miniSpacer,
                  ),
                  const Text(
                    "Tâches effectuées",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    widget.rapport['report'],
                    style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.normal,
                        color: textBlack),
                  ),
                  const SizedBox(
                    height: miniSpacer,
                  ),
                  const Text(
                    "Difficultés rencontrées",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: miniSpacer,
                  ),
                  Text(
                    widget.rapport['difficulty'],
                    style: const TextStyle(
                        fontSize: 12,
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
