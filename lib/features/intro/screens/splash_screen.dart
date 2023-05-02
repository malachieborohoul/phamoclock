import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:phamoclock/common/widgets/bottom_bar.dart';
import 'package:phamoclock/constants/colors.dart';
import 'package:phamoclock/features/auth/screens/auth_screen.dart';
import 'package:phamoclock/features/auth/services/auth_service.dart';
import 'package:phamoclock/providers/user_provider.dart';
import 'package:provider/provider.dart';
import 'package:phamoclock/models/user.dart' as model;

class SplashScreen extends StatefulWidget {
  static const routeName = "/splash-screen";
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late final _animationController =
      AnimationController(vsync: this, duration: const Duration(seconds: 1));

  late final Animation<double> _animation = Tween<double>(begin: 1.0, end: 1.2)
      .animate(CurvedAnimation(
          parent: _animationController, curve: Curves.decelerate));

  late Future<model.User> userFuture;
  late Future<DocumentSnapshot> horaireSnap;

  AuthService authService = AuthService();


  late Future<DocumentSnapshot> snap;

  @override
  void initState() {
    // authService.getUserData(context);

    // _animationController.addStatusListener((status) {
    //   if (status == AnimationStatus.completed) {
    //     _animationController.reverse();
    //   } else if (status == AnimationStatus.dismissed) {
    //     _animationController.forward();
    //   }
    // });

    userFuture = authService.getUserData();
    context.read<UserProvider>().setUser(userFuture);

    
    // getUserData();
    _animationController.forward();
    _animationController.addStatusListener((status) {
      if (_animationController.status == AnimationStatus.completed) {
        _animationController.reverse();
      } else if (_animationController.status == AnimationStatus.dismissed) {
        _animationController.forward();
      }
    });

    super.initState();
  }

  // getUserData() {
  //   print("From getUser");
  //   userFuture = authService.getUserData(context);
  // }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: FutureBuilder(
              future: userFuture,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return const BottomBar();
                } else {
                  if (!snapshot.hasError) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ScaleTransition(
                          scale: _animation,
                          child: const Text(
                            "PHAMACLOCK",
                            style: TextStyle(
                                color: primary,
                                fontSize: 50,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        // const Padding(
                        //   padding: EdgeInsets.only(top: 100.0),
                        //   child: Loader(),
                        // )
                      ],
                    );
                  }
                  return const AuthScreen();
                }
              })),
    );
  }
}
