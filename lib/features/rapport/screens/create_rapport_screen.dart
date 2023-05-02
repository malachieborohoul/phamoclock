import 'package:flutter/material.dart';
import 'package:phamoclock/common/widgets/custom_button_box.dart';
import 'package:phamoclock/common/widgets/custom_heading.dart';
import 'package:phamoclock/common/widgets/custom_textfield_exigence.dart';
import 'package:phamoclock/common/widgets/loader.dart';
import 'package:phamoclock/constants/colors.dart';
import 'package:phamoclock/constants/padding.dart';
import 'package:phamoclock/constants/utils.dart';
import 'package:phamoclock/features/rapport/services/rapport_service.dart';

class CreateRapportScreen extends StatefulWidget {
  const CreateRapportScreen({super.key, this.controller});
  final ScrollController? controller;
  static const routeName = '/create-rapport-screen';

  @override
  State<CreateRapportScreen> createState() => _CreateRapportScreenState();
}

class _CreateRapportScreenState extends State<CreateRapportScreen> {
  final _createRapportFormKey = GlobalKey<FormState>();

  TextEditingController travailEffectueController = TextEditingController();
  TextEditingController difficultesController = TextEditingController();
  bool isPressed = false;
  bool isCharging = false;

  final RapportService _rapportService = RapportService();

  @override
  Widget build(BuildContext context) {
    void addRapport() {
      _rapportService.addRapport(
          travailEffectueController.text, difficultesController.text, context,
          () {
        setState(() {
          showSnackBar(context, "Rapport a été ajouté");
          isCharging = false;
          Navigator.pop(context);
        });
      });
    }

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: SingleChildScrollView(
        controller: widget.controller,
        child: Padding(
          padding: const EdgeInsets.all(appPadding),
          child: Form(
            key: _createRapportFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const CustomHeading(
                    title: "Rédiger un rapport", color: primary),
                CustomTextFieldRapport(
                  hintText: "Ce qui a été fait aujourd'hui:",
                  controller: travailEffectueController,
                  maxLines: 4,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "As tu rencontré des difficulté ?",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          isPressed = !isPressed;
                        });
                      },
                      icon: Icon(
                        isPressed == false
                            ? Icons.toggle_off_outlined
                            : Icons.toggle_on_outlined,
                        color: primary,
                        size: 35,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: miniSpacer,
                ),
                isPressed == true
                    ? CustomTextFieldRapport(
                        hintText: "Difficultés rencontrées:",
                        controller: difficultesController,
                        maxLines: 4,
                      )
                    : Container(),
                const SizedBox(
                  height: miniSpacer,
                ),
                GestureDetector(
                  onTap: () {
                    if (_createRapportFormKey.currentState!.validate()) {
                      setState(() {
                        isCharging = true;
                        addRapport();
                      });
                    }
                  },
                  child: isCharging
                      ? const Loader()
                      : const CustomButtonBox(title: "Envoyer"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
