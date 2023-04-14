import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:phamoclock/common/animations/opacity_tween.dart';
import 'package:phamoclock/common/widgets/custom_button_box.dart';
import 'package:phamoclock/common/widgets/custom_heading.dart';
import 'package:phamoclock/common/widgets/custom_textfield.dart';
import 'package:phamoclock/constants/colors.dart';
import 'package:phamoclock/constants/padding.dart';

enum Auth {
  sign_up,
  login,
}

class AddPersonnelScreen extends StatefulWidget {
  static const routeName = '/add-personnel-screen';
  const AddPersonnelScreen({Key? key}) : super(key: key);

  @override
  State<AddPersonnelScreen> createState() => _AddPersonnelScreenState();
}

class _AddPersonnelScreenState extends State<AddPersonnelScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController prenomController = TextEditingController();
  bool isCharging = false;

  TextEditingController cPasswordController = TextEditingController();
  Auth _auth = Auth.login;
  final _signUpFormKey = GlobalKey<FormState>();
  final _signInFormKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isAdmin = false;

  // void signUpUser() {
  //   authService.signUpUser(
  //     context: context,
  //     name: nameController.text,
  //     prenom: prenomController.text,
  //     email: emailController.text,
  //     password: passwordController.text,
  //     onSuccess: () {
  //       setState(() {
  //         isCharging = false;
  //       });
  //     },
  //   );
  // }

  // void signInUser() {
  //   authService.signInUser(
  //       context: context,
  //       email: emailController.text,
  //       password: passwordController.text,
  //       onSuccess: () {
  //         setState(() {
  //           isCharging = false;
  //         });
  //       },
  //       onFailed: () {
  //         setState(() {
  //           isCharging = false;
  //         });
  //       });
  // }

  // @override
  // void initState() {
  //   Future.delayed(Duration(seconds: 3), () {
  //     SplashScreen();
  //   });
  //   super.initState();
  // }

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    prenomController.dispose();
    emailController.dispose();
    passwordController.dispose();
    cPasswordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final numberEntry =Provider.of<NumberEntryProvider>(context, listen: false);

    //   print(numberEntry.count);
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
          backgroundColor: background,
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(appPadding),
              child: Form(
                key: _signUpFormKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: spacer,
                    ),
                    const OpacityTween(
                      begin: 0.0,
                      child: CustomHeading(
                          title: "Ajouter un employé", color: secondary),
                    ),
                    const SizedBox(
                      height: miniSpacer,
                    ),
                    OpacityTween(
                      begin: 0.2,
                      child: CustomTextField(
                        prefixIcon: "user_icon.svg",
                        labelText: "Nom ",
                        controller: nameController,
                        iconColor: primary,
                      ),
                    ),
                    const SizedBox(
                      height: spacer - 40,
                    ),
                    OpacityTween(
                      begin: 0.2,
                      child: CustomTextField(
                        prefixIcon: "user_icon.svg",
                        labelText: "Prenom ",
                        controller: prenomController,
                        iconColor: primary,
                      ),
                    ),
                    const SizedBox(
                      height: spacer - 40,
                    ),
                    OpacityTween(
                      begin: 0.2,
                      child: CustomTextField(
                        prefixIcon: "email_icon.svg",
                        labelText: "Adresse email",
                        controller: emailController,
                        iconColor: primary,
                        keyboardType: TextInputType.emailAddress,
                      ),
                    ),
                    const SizedBox(
                      height: spacer - 40,
                    ),
                    OpacityTween(
                      begin: 0.2,
                      child: CustomTextField(
                        prefixIcon: "email_icon.svg",
                        labelText: "Téléphone",
                        controller: emailController,
                        iconColor: primary,
                        keyboardType: TextInputType.phone,
                      ),
                    ),
                    const SizedBox(
                      height: spacer - 40,
                    ),
                    OpacityTween(
                      begin: 0.2,
                      child: CustomTextField(
                        prefixIcon: "key_icon.svg",
                        labelText: "Mot de passe",
                        controller: passwordController,
                        iconColor: primary,
                        isPassword: true,
                      ),
                    ),
                    OpacityTween(
                        begin: 0.2,
                        child: Row(
                          children: [
                            const Text(
                              "Administrateur ?",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            IconButton(
                                onPressed: () {
                                  setState(() {
                                    isAdmin = !isAdmin;
                                  });
                                },
                                icon: Icon(
                                  isAdmin == false
                                      ? Icons.toggle_off_outlined
                                      : Icons.toggle_on_outlined,
                                  color: primary,
                                  size: 38,
                                ))
                          ],
                        )),
                    const SizedBox(
                      height: spacer,
                    ),
                    GestureDetector(
                        onTap: () {
                          if (_signUpFormKey.currentState!.validate()) {
                            setState(() {
                              isCharging = true;
                            });
                            // signUpUser();
                          }
                        },
                        child: OpacityTween(
                          begin: 0.2,
                          child: Column(
                            children: [
                              const CustomButtonBox(title: "Ajouter"),
                              isCharging == true
                                  ? CircularProgressIndicator(
                                      color: primary,
                                    )
                                  : Text("")
                            ],
                          ),
                        )),
                    const SizedBox(
                      height: spacer,
                    ),
                    const SizedBox(
                      height: spacer - 30,
                    ),
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
