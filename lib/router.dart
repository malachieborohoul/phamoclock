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
      break;
    case DetailsRapportScreen.routeName:
      return MaterialPageRoute(
        builder: (_) => const DetailsRapportScreen(),
      );
      break;
    case DetailsPersonnelScreen.routeName:
      return MaterialPageRoute(
        builder: (_) => const DetailsPersonnelScreen(),
      );
      break;
      case SplashScreen.routeName:
      return MaterialPageRoute(
        builder: (_) => const SplashScreen(),
      );
      break;
       case AuthScreen.routeName:
      return MaterialPageRoute(
        builder: (_) => const AuthScreen(),
      );
      break;
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
