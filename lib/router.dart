import 'package:flutter/material.dart';
import 'package:phamoclock/features/admin/personnel/screens/details_personnel_screen.dart';
import 'package:phamoclock/features/rapport/screens/details_rapport_screen.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
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
