import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:phamoclock/common/widgets/custom_dashborad_card.dart';
import 'package:phamoclock/common/widgets/custom_heading.dart';
import 'package:phamoclock/common/widgets/custom_schedule.dart';
import 'package:phamoclock/common/widgets/loader.dart';
import 'package:phamoclock/constants/colors.dart';
import 'package:phamoclock/constants/padding.dart';
import 'package:phamoclock/features/auth/screens/auth_screen.dart';
import 'package:phamoclock/features/auth/services/auth_service.dart';
import 'package:phamoclock/features/home/services/home_service.dart';
import 'package:phamoclock/providers/user_provider.dart';
import 'package:provider/provider.dart';
import 'package:phamoclock/models/user.dart' as model;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  AuthService _authService = AuthService();

  HomeService _homeService = HomeService();

  bool isCharging = false;

  late Stream<QuerySnapshot<Map<String, dynamic>>> horaireSnap;

  void logout() {
    _authService.logOut(() {
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
  }

  void getHoraireData() async {
    horaireSnap = await _homeService.getHoraireData();
  }

  @override
  Widget build(BuildContext context) {
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
                                logout();
                              },
                              icon: const Icon(Icons.logout_sharp)),
                        ],
                      ),
                      const SizedBox(
                        height: spacer,
                      ),
                      Row(
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
                      const SizedBox(
                        height: miniSpacer,
                      ),
                      userProvider.isAdmin
                          ? const Text(
                              "Bienvenue Admin",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400,
                                  color: grey),
                            )
                          : const Text(
                              "Bienvenue sur ton espace de présences",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400,
                                  color: grey),
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                              ],
                            )
                          : Text(""),
                      CustomHeading(title: "Horaires", color: primary),
                      const SizedBox(
                        height: miniSpacer,
                      ),
                      StreamBuilder(
                          stream: horaireSnap,
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return Loader();
                            }
                            return ListView.builder(
                                itemBuilder: (context, index) {
                              return CustomSchedule(
                                day: "Aujourd'hui",
                                arivalHour: "8:00",
                                departureHour: "19:00",
                              );
                            });
                          })
                    ],
                  ),
                )),
    );
  }
}
