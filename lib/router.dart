import 'package:flutter/material.dart';
import 'package:phamoclock/common/widgets/bottom_bar.dart';
import 'package:phamoclock/features/admin/personnel/screens/details_personnel_screen.dart';
import 'package:phamoclock/features/auth/screens/auth_screen.dart';
import 'package:phamoclock/features/intro/screens/splash_screen.dart';
import 'package:phamoclock/features/rapport/screens/details_rapport_screen.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case BottomBar.routeName:
      return MaterialPageRoute(
        builder: (_) => const BottomBar(),
      );
    case DetailsRapportScreen.routeName:
      var rapport = routeSettings.arguments;
      return MaterialPageRoute(
        builder: (_) =>  DetailsRapportScreen(
          rapport: rapport,
        ),
      );
    case DetailsPersonnelScreen.routeName:
      return MaterialPageRoute(
        builder: (_) => const DetailsPersonnelScreen(),
      );
    case SplashScreen.routeName:
      return MaterialPageRoute(
        builder: (_) => const SplashScreen(),
      );
    case AuthScreen.routeName:
      return MaterialPageRoute(
        builder: (_) => const AuthScreen(),
      );
    default:
      return MaterialPageRoute(
        builder: (_) => const Scaffold(
          body: Center(
            child: Text("Error 404"),
          ),
        ),
      );
  }
}
