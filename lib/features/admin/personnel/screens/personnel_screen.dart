import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:phamoclock/common/widgets/alert_dialog_modify_role.dart';
import 'package:phamoclock/common/widgets/custom_heading.dart';
import 'package:phamoclock/features/admin/personnel/screens/details_personnel_screen.dart';

import '../../../../common/widgets/loader.dart';
import '../../../../constants/colors.dart';
import '../../../../constants/padding.dart';

class PersonnelScreen extends StatefulWidget {
  static const routeName = '/personnel-screen';

  const PersonnelScreen({super.key});

  @override
  State<PersonnelScreen> createState() => _PersonnelScreenState();
}

class _PersonnelScreenState extends State<PersonnelScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(appPadding),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomHeading(title: "Liste personnel", color: primary),
            GestureDetector(
              onTap: () => Navigator.pushNamed(
                  context, DetailsPersonnelScreen.routeName),
              child: Container(
                margin: const EdgeInsets.only(bottom: 20),
                height: 100,
                decoration: const BoxDecoration(
                    color: textWhite,
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey,
                          spreadRadius: 0.5,
                          blurRadius: 2,
                          offset: Offset(0, 5))
                    ]),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 50,
                            height: 50,
                            decoration: const BoxDecoration(
                              color: primary,
                              borderRadius: BorderRadius.all(
                                Radius.circular(50),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: miniSpacer,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                "Borohoul Malachie",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "malachieboro",
                                style: TextStyle(
                                    fontWeight: FontWeight.normal, color: grey),
                              ),
                            ],
                          )
                        ],
                      ),
                      GestureDetector(
                        child: PopupMenuButton(onSelected: (value) {
                          if (value == 1) {
                            Navigator.pushNamed(
                                context, DetailsPersonnelScreen.routeName);
                            // Navigator.pushNamed(context, PlanScreen.routeName,
                            //     arguments: widget.cours);

                            // Provider.of<CoursPlanProvider>(context, listen: false)
                            //     .set_cours(widget.cours);
                          } else if (value == 2) {
                            showDialog(
                                context: context,
                                builder: (context) => AlertDialogModifyRole());
                          } else if (value == 3) {
                            // Navigator.pushNamed(context, ExigenceScreen.routeName,
                            //     arguments: widget.cours);
                          } else if (value == 4) {
                            // Navigator.pushNamed(context, ResultatScreen.routeName,
                            //     arguments: widget.cours);
                          } else if (value == 5) {
                            showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                      title: Text("Notification"),
                                      content:
                                          /*isCharging == true
                                          ? Loader()
                                          : */
                                          Container(
                                        height: 90,
                                        child: Column(
                                          children: [
                                            Text(
                                              "Voulez vous supprimer le cours?",
                                              style: TextStyle(fontSize: 15),
                                            ),
                                            const SizedBox(
                                              height: appPadding,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                InkWell(
                                                    onTap: () {
                                                      // Navigator.pop(context);
                                                      setState(() {
                                                        // deleteCours();
                                                        // isCharging = true;
                                                      });
                                                    },
                                                    splashColor:
                                                        Colors.grey.shade200,
                                                    child: Container(
                                                      alignment:
                                                          Alignment.center,
                                                      width: 40,
                                                      height: 30,
                                                      decoration: BoxDecoration(
                                                          color: Colors.green,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      15)),
                                                      child: Text(
                                                        "Oui",
                                                        style: TextStyle(
                                                            color: textWhite),
                                                      ),
                                                    )),
                                                InkWell(
                                                    onTap: () {
                                                      Navigator.pop(context);
                                                    },
                                                    splashColor:
                                                        Colors.grey.shade200,
                                                    child: Container(
                                                      alignment:
                                                          Alignment.center,
                                                      width: 40,
                                                      height: 30,
                                                      decoration: BoxDecoration(
                                                          color: Colors.red,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      15)),
                                                      child: Text(
                                                        "Non",
                                                        style: TextStyle(
                                                            color: textWhite),
                                                      ),
                                                    )),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ));
                          } else if (value == 6) {
                            showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                      title: Text("Notification"),
                                      content:
                                          /*isCharging == true
                                          ? Loader()
                                          : */
                                          Container(
                                        height: 90,
                                        child: Column(
                                          children: [
                                            Text(
                                              "Voulez vous publier le cours?",
                                              style: TextStyle(fontSize: 15),
                                            ),
                                            const SizedBox(
                                              height: appPadding,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                InkWell(
                                                    onTap: () {
                                                      // Navigator.pop(context);
                                                      // setState(() {
                                                      //   publishCours();
                                                      //   isCharging = true;
                                                      // });
                                                    },
                                                    splashColor:
                                                        Colors.grey.shade200,
                                                    child: Container(
                                                      alignment:
                                                          Alignment.center,
                                                      width: 40,
                                                      height: 30,
                                                      decoration: BoxDecoration(
                                                          color: Colors.green,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      15)),
                                                      child: Text(
                                                        "Oui",
                                                        style: TextStyle(
                                                            color: textWhite),
                                                      ),
                                                    )),
                                                InkWell(
                                                    onTap: () {
                                                      Navigator.pop(context);
                                                    },
                                                    splashColor:
                                                        Colors.grey.shade200,
                                                    child: Container(
                                                      alignment:
                                                          Alignment.center,
                                                      width: 40,
                                                      height: 30,
                                                      decoration: BoxDecoration(
                                                          color: Colors.red,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      15)),
                                                      child: Text(
                                                        "Non",
                                                        style: TextStyle(
                                                            color: textWhite),
                                                      ),
                                                    )),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ));
                          } else if (value == 7) {
                            showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                      title: Text("Notification"),
                                      content:
                                          /*isCharging == true
                                          ? /*Loader()*/ Text("")
                                          : */
                                          Container(
                                        height: 90,
                                        child: Column(
                                          children: [
                                            Text(
                                              "Voulez vous désactiver le cours?",
                                              style: TextStyle(fontSize: 15),
                                            ),
                                            const SizedBox(
                                              height: appPadding,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                InkWell(
                                                    onTap: () {
                                                      // Navigator.pop(context);
                                                      // setState(() {
                                                      //   deactivateCours();
                                                      //   isCharging = true;
                                                      // });
                                                    },
                                                    splashColor:
                                                        Colors.grey.shade200,
                                                    child: Container(
                                                      alignment:
                                                          Alignment.center,
                                                      width: 40,
                                                      height: 30,
                                                      decoration: BoxDecoration(
                                                          color: Colors.green,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      15)),
                                                      child: Text(
                                                        "Oui",
                                                        style: TextStyle(
                                                            color: textWhite),
                                                      ),
                                                    )),
                                                InkWell(
                                                    onTap: () {
                                                      Navigator.pop(context);
                                                    },
                                                    splashColor:
                                                        Colors.grey.shade200,
                                                    child: Container(
                                                      alignment:
                                                          Alignment.center,
                                                      width: 40,
                                                      height: 30,
                                                      decoration: BoxDecoration(
                                                          color: Colors.red,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      15)),
                                                      child: Text(
                                                        "Non",
                                                        style: TextStyle(
                                                            color: textWhite),
                                                      ),
                                                    )),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ));
                          }
                        }, itemBuilder: (context) {
                          return [
                            PopupMenuItem(
                              value: 1,
                              child: Text("Profil"),
                              onTap: () {},
                            ),
                            PopupMenuItem(
                              value: 2,
                              child: Text("Modifier rôle"),
                              onTap: () {},
                            ),
                          ];
                        }),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
