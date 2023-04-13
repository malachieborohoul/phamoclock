import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:phamoclock/common/widgets/custom_button_box.dart';
import 'package:phamoclock/common/widgets/custom_heading.dart';

import '../../constants/colors.dart';

class AlertDialogModifyRole extends StatefulWidget {
  // final Cours cours;
  const AlertDialogModifyRole({
    Key? key,
  }) : super(key: key);

  @override
  State<AlertDialogModifyRole> createState() => _AlertDialogModifyRoleState();
}

class _AlertDialogModifyRoleState extends State<AlertDialogModifyRole> {
  final _addSectionFormKey = GlobalKey<FormState>();

  TextEditingController titreSectionController = TextEditingController();

  // PlanService planService = PlanService();
  bool _isCharging = false;

  @override
  void dispose() {
    super.dispose();
    titreSectionController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // void addSection() {
    //   planService.addSection(context, titreSectionController.text, widget.cours,
    //       () {
    //     setState(() {
    //       _isCharging = false;
    //       Navigator.popAndPushNamed(context, PlanScreen.routeName,
    //           arguments: widget.cours);
    //     });
    //   });
    // }

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Form(
        key: _addSectionFormKey,
        child: AlertDialog(
          backgroundColor: Colors.grey.shade100,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                  child: Text(
                "Modifier le rôle",
                style: TextStyle(fontSize: 20),
              )),
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.red),
                      child: Center(
                        child: Icon(
                          Icons.close,
                          color: textWhite,
                        ),
                      )))
            ],
          ),
          content: _isCharging == true
              ? Center(
                  child: CircularProgressIndicator(
                    color: primary,
                  ),
                )
              : Container(
                  height: MediaQuery.of(context).size.height * 0.2,
                  child: Column(
                    children: [
                      // CustomHeading(
                      //   title: "Titre",
                      //   color: primary,
                      // ),
                      const SizedBox(
                        height: 15,
                      ),
                      DropdownButtonFormField(
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: textWhite,
                            hintStyle: TextStyle(color: Colors.grey.shade300),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          hint: Text("Sélectionner une catégorie"),
                          value: 0,
                          items: [
                            DropdownMenuItem(
                              child: Text("Admin"),
                              value: 0,
                            ),
                            DropdownMenuItem(
                              child: Text("Employé"),
                              value: 1,
                            ),
                          ],
                          onChanged: (int? val) {
                            // setState(() {
                            //   dropdownvalue_categorie = val!;
                            //   id_categorie =
                            //       int.parse(dropdownvalue_categorie!);

                            // });
                          }),
                    ],
                  ),
                ),
          actions: [
            InkWell(
                splashColor: textBlack,
                borderRadius: BorderRadius.circular(17.5),
                onTap: () {
                  // if (_addSectionFormKey.currentState!.validate()) {
                  //   setState(() {
                  //     _isCharging = true;
                  //   });
                  //   addSection();
                  // }
                },
                child: CustomButtonBox(title: "Enregistrer"))
          ],
        ),
      ),
    );
  }
}
