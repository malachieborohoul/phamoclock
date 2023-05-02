import 'package:flutter/material.dart';
import 'package:phamoclock/features/auth/services/auth_service.dart';

import '../../../common/animations/opacity_tween.dart';
import '../../../common/animations/slide_down_tween.dart';
import '../../../common/widgets/custom_button_box.dart';
import '../../../common/widgets/custom_heading.dart';
import '../../../common/widgets/custom_textfield.dart';
import '../../../constants/colors.dart';
import '../../../constants/padding.dart';

enum Auth {
  signUp,
  login,
}

class AuthScreen extends StatefulWidget {
  static const routeName = '/auth-screen';
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController prenomController = TextEditingController();
  bool isCharging = false;

  TextEditingController cPasswordController = TextEditingController();
  Auth _auth = Auth.login;
  final _signUpFormKey = GlobalKey<FormState>();
  final _signInFormKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final AuthService _authService = AuthService();
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

  void signInUser() {
    _authService.login(
        email: emailController.text,
        password: passwordController.text,
        context: context,
        onSuccess: () {
          setState(() {
            isCharging = false;
          });
        });
  }

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
          body: _auth == Auth.signUp
              ?
              //SIGNUPSCREEN
              SingleChildScrollView(
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
                                title: "Inscrivez vous",
                                subTitle: "Bienvenue",
                                color: secondary),
                          ),
                          const SizedBox(
                            height: spacer,
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
                              prefixIcon: "key_icon.svg",
                              labelText: "Mot de passe",
                              controller: passwordController,
                              iconColor: primary,
                              isPassword: true,
                            ),
                          ),
                          const SizedBox(
                            height: spacer - 40,
                          ),
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
                                    const CustomButtonBox(title: "S'inscrire"),
                                    isCharging == true
                                        ? const CircularProgressIndicator(
                                            color: primary,
                                          )
                                        : const Text("")
                                  ],
                                ),
                              )),
                          const SizedBox(
                            height: spacer,
                          ),
                          Row(
                            children: [
                              Text(
                                "Vous avez déjà un compte ?",
                                style: TextStyle(
                                    color: secondary.withOpacity(0.5)),
                              ),
                              GestureDetector(
                                onTap: () {
                                  _auth = Auth.login;
                                  setState(() {});
                                },
                                child: const Text(
                                  "Connectez vous",
                                  style: TextStyle(color: primary),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: spacer - 30,
                          ),
                          const Center(
                              child: Text(
                            "Avec",
                            style: TextStyle(color: textBlack),
                          )),
                          const SizedBox(
                            height: spacer - 30,
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              :
              //LOGINSCREEN
              SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(appPadding),
                    child: Form(
                      key: _signInFormKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 4,
                          ),
                          const SlideDownTween(
                            offset: 40,
                            delay: 1.0,
                            child: OpacityTween(
                              begin: 0,
                              child: Center(
                                child: Text(
                                  "PHAMOCLOCK",
                                  style: TextStyle(
                                      color: primary,
                                      fontSize: 40,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: spacer - 40,
                          ),
                          const SlideDownTween(
                            delay: 1.4,
                            offset: 40,
                            child: OpacityTween(
                              begin: 0.2,
                              child: CustomHeading(
                                  title: "Connectez-vous", color: secondary),
                            ),
                          ),
                          const SizedBox(
                            height: spacer - 40,
                          ),
                          SlideDownTween(
                            offset: 50,
                            delay: 1.6,
                            child: OpacityTween(
                              begin: 0.4,
                              child: CustomTextField(
                                prefixIcon: "email_icon.svg",
                                labelText: "Adresse email",
                                controller: emailController,
                                iconColor: primary,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: spacer - 40,
                          ),
                          SlideDownTween(
                            offset: 50,
                            delay: 1.6,
                            child: OpacityTween(
                              begin: 0.4,
                              child: CustomTextField(
                                prefixIcon: "key_icon.svg",
                                labelText: "Mot de passe",
                                controller: passwordController,
                                iconColor: primary,
                                isPassword: true,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: spacer,
                          ),
                          GestureDetector(
                              onTap: () {
                                if (_signInFormKey.currentState!.validate()) {
                                  setState(() {
                                    isCharging = true;
                                  });
                                  signInUser();
                                }
                              },
                              child: SlideDownTween(
                                offset: 40,
                                delay: 2.0,
                                child: OpacityTween(
                                  begin: 0.5,
                                  child: Column(
                                    children: [
                                      const CustomButtonBox(
                                          title: "Se connecter"),
                                      isCharging == true
                                          ? const CircularProgressIndicator(
                                              color: primary,
                                            )
                                          : const Text("")
                                    ],
                                  ),
                                ),
                              )),
                          const SizedBox(
                            height: spacer - 30,
                          ),
                          const Text(
                            "Mot de passe oublié ?",
                            style: TextStyle(color: primary),
                          )
                        ],
                      ),
                    ),
                  ),
                )),
    );
  }
}
