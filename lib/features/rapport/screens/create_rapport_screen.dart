import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:phamoclock/common/widgets/custom_button_box.dart';
import 'package:phamoclock/common/widgets/custom_heading.dart';
import 'package:phamoclock/common/widgets/custom_textfield_exigence.dart';
import 'package:phamoclock/constants/colors.dart';
import 'package:phamoclock/constants/padding.dart';

class CreateRapportScreen extends StatefulWidget {
  const CreateRapportScreen({super.key, this.controller});
  final ScrollController? controller;
  static const routeName = '/create-rapport-screen';

  @override
  State<CreateRapportScreen> createState() => _CreateRapportScreenState();
}

class _CreateRapportScreenState extends State<CreateRapportScreen> {
  TextEditingController travailEffectueController = TextEditingController();
  TextEditingController difficultesController = TextEditingController();
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: SingleChildScrollView(
        controller: widget.controller,
        child: Padding(
          padding: EdgeInsets.all(appPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomHeading(title: "Rédiger un rapport", color: primary),
              CustomTextFieldRapport(
                hintText: "Ce qui a été fait aujourd'hui:",
                controller: travailEffectueController,
                maxLines: 4,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "As tu rencontré des difficulté ?",
                    style: TextStyle(fontSize: 15),
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
              const CustomButtonBox(title: "Envoyer")
            ],
          ),
        ),
      ),
    );
  }
}
