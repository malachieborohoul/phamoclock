import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case "value":
      return MaterialPageRoute(
        builder: (_) => const Text("data"),
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
