import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:phamoclock/common/animations/opacity_tween.dart';
import 'package:phamoclock/common/animations/slide_right_tween.dart';
import 'package:phamoclock/common/widgets/custom_heading.dart';
import 'package:phamoclock/common/widgets/custom_rapport.dart';
import 'package:phamoclock/common/widgets/loader.dart';
import 'package:phamoclock/constants/colors.dart';
import 'package:phamoclock/constants/padding.dart';
import 'package:phamoclock/features/rapport/screens/details_rapport_screen.dart';
import 'package:phamoclock/features/rapport/services/rapport_service.dart';

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

  late Stream<QuerySnapshot<Map<String, dynamic>>> rapportSnap;
  final RapportService _rapportService = RapportService();

  @override
  void initState() {
    super.initState();
    getRapportData();
  }

  void getRapportData() {
    rapportSnap = _rapportService.getRapportData();
  }

  @override
  Widget build(BuildContext context) {
    initializeDateFormatting('fr');

    return SafeArea(
      child: Scaffold(
        body: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(appPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomHeading(title: "Mes derniers rapports", color: primary),
                  StreamBuilder(
                      stream: rapportSnap,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Loader();
                        }
                        return ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: snapshot.data!.docs.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                  onTap: () => Navigator.pushNamed(
                                      context, DetailsRapportScreen.routeName,
                                      arguments:
                                          snapshot.data!.docs[index].data()),
                                  child: SlideRightTween(
                                    duration:
                                        Duration(milliseconds: index * 500),
                                    curve: Curves.easeInOutCubic,
                                    offset: 80,
                                    child: OpacityTween(
                                      begin: 0.0,
                                      child: CustomRapport(
                                          date: DateFormat.MMMEd('fr').format(
                                              snapshot.data!.docs[index]
                                                  .data()['createdAt']
                                                  .toDate()),
                                          rapport: snapshot.data!.docs[index]
                                              ['report']),
                                    ),
                                  ));
                            });
                      })
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
