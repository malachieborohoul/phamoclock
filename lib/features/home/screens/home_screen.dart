import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:phamoclock/common/animations/opacity_tween.dart';
import 'package:phamoclock/common/widgets/custom_dashborad_card.dart';
import 'package:phamoclock/common/widgets/custom_heading.dart';
import 'package:phamoclock/common/widgets/custom_schedule.dart';
import 'package:phamoclock/common/widgets/loader.dart';
import 'package:phamoclock/constants/colors.dart';
import 'package:phamoclock/constants/padding.dart';
import 'package:phamoclock/features/auth/screens/auth_screen.dart';
import 'package:phamoclock/features/auth/services/auth_service.dart';
import 'package:phamoclock/features/home/services/home_service.dart';
import 'package:phamoclock/features/rapport/services/rapport_service.dart';
import 'package:phamoclock/providers/user_provider.dart';
import 'package:provider/provider.dart';
import 'package:phamoclock/models/user.dart' as model;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final AuthService _authService = AuthService();

  final HomeService _homeService = HomeService();
  final RapportService _rapportService = RapportService();

  bool isCharging = false;

  late Stream<QuerySnapshot<Map<String, dynamic>>> horaireSnap;
  late Stream<QuerySnapshot<Map<String, dynamic>>> rapportSnap;

  void logout(model.User user) {
    _homeService.logOut(user,() {
      setState(() {
        isCharging = false;
        Navigator.pushNamedAndRemoveUntil(
            context, AuthScreen.routeName, (route) => false);
      });
    });
  }

  @override
  void initState() {
    // WidgetsBinding.instance.addPersistentFrameCallback((timeStamp) {
    // });
    super.initState();
    getHoraireData();
    // _homeService.setDateConnexion(() {});

  }

  void getHoraireData() {
    horaireSnap = _homeService.getHoraireData();
  }

  void getRapportData() {
    rapportSnap = _rapportService.getRapportData();
  }

  @override
  Widget build(BuildContext context) {
    initializeDateFormatting('fr');

    model.User userProvider = context.watch<UserProvider>().getUser;
    return SafeArea(
      child: Scaffold(
          body: isCharging
              ? Column(
                  children: const [
                    Text(
                      "Déconnexion",
                      style: TextStyle(color: primary),
                    ),
                    Loader()
                  ],
                )
              : SingleChildScrollView(
                  padding: const EdgeInsets.all(appPadding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                                color: primary,
                                borderRadius: BorderRadius.circular(14)),
                          ),
                          IconButton(
                              onPressed: () {
                                logout(userProvider);
                              },
                              icon: const Icon(Icons.logout_sharp)),
                        ],
                      ),
                      const SizedBox(
                        height: spacer,
                      ),
                      OpacityTween(
                        begin: 0.0,
                        child: Row(
                          children: [
                            Text(
                              "Salut ${userProvider.lastName}!",
                              style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: secondary.withOpacity(1)),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: miniSpacer,
                      ),
                      userProvider.isAdmin
                          ? const OpacityTween(
                              begin: 0.0,
                              child: Text(
                                "Bienvenue Admin",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400,
                                    color: grey),
                              ),
                            )
                          : const OpacityTween(
                              begin: 0.0,
                              child: Text(
                                "Bienvenue sur ton espace de présences",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400,
                                    color: grey),
                              ),
                            ),
                      const SizedBox(
                        height: spacer,
                      ),
                      userProvider.isAdmin
                          ? Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: const [
                                    OpacityTween(
                                      begin: 0.0,
                                      child: CustomDashboardCard(
                                        color: primary,
                                        icon: Icons.people_rounded,
                                        name: "Personnel",
                                        number: "4",
                                      ),
                                    ),
                                    OpacityTween(
                                      begin: 0.0,
                                      child: CustomDashboardCard(
                                        color: secondary,
                                        icon: Icons.book_rounded,
                                        name: "Rapports non lus",
                                        number: "1",
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: miniSpacer,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: const [
                                    OpacityTween(
                                      begin: 0.0,
                                      child: CustomDashboardCard(
                                        color: third,
                                        icon: Icons.lock_person_rounded,
                                        name: "Administrateurs",
                                        number: "3",
                                      ),
                                    ),
                                    OpacityTween(
                                      begin: 0.0,
                                      child: CustomDashboardCard(
                                        color: orange,
                                        icon: Icons.calendar_month,
                                        name: "Rapports non lus",
                                        number: "1",
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            )
                          : const Text(""),
                      const SizedBox(
                        height: miniSpacer,
                      ),
                      const OpacityTween(
                          begin: 0.0,
                          child:
                              CustomHeading(title: "Horaires", color: primary)),
                      const SizedBox(
                        height: miniSpacer,
                      ),
                      StreamBuilder(
                          stream: horaireSnap,
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
                                  return CustomSchedule(
                                      color: int.parse(DateFormat.H().format(snapshot.data!.docs[index].data()['heureArrivee'].toDate())) > 9
                                          ? Colors.red
                                          : primary,
                                      day: DateFormat.MMMEd('fr').format(
                                          snapshot.data!.docs[index]
                                              .data()['heureArrivee']
                                              .toDate()),
                                      arivalHour: snapshot.data!.docs[index].data()['heureArrivee'] != null
                                          ? DateFormat.Hm().format(snapshot
                                              .data!.docs[index]
                                              .data()['heureArrivee']
                                              .toDate())
                                          : "---|---",
                                      departureHour: snapshot.data!.docs[index]
                                                  .data()['heureDepart'] !=
                                              null
                                          ? DateFormat.Hm()
                                              .format(snapshot.data!.docs[index].data()['heureDepart'].toDate())
                                          : "---|---");
                                });
                          })
                    ],
                  ),
                )),
    );
  }
}
