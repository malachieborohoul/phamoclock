import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:phamoclock/common/widgets/loader.dart';
import 'package:phamoclock/constants/colors.dart';
import 'package:phamoclock/features/auth/screens/auth_screen.dart';
import 'package:phamoclock/features/auth/services/auth_service.dart';
import 'package:phamoclock/providers/user_provider.dart';

import 'package:provider/provider.dart';

import '../../../common/widgets/bottom_bar.dart';

class MySplashScreen extends StatefulWidget {
  @override
  State<MySplashScreen> createState() => _MySplashScreenState();
}

class _MySplashScreenState extends State<MySplashScreen> {
  final authService = AuthService();
  startTimer() {
    Timer(const Duration(seconds: 3), () async {
      StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.active) {
              if (snapshot.hasData) {
                return const BottomBar();
              } else if (snapshot.hasError) {
                return Center(
                  child: Text("${snapshot.error}"),
                );
              }
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Loader();
            }
            return AuthScreen();
          });
    });
  }

  @override
  void initState() {
    super.initState();
    

    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const[
             Text(
              "PHAMACLOCK",
              style: TextStyle(fontSize: 50, color: primary),
            ),
            CircularProgressIndicator(
              color: primary,
            )
          ],
        ),
      ),
    );
  }
}
