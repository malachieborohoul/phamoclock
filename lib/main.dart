import 'package:flutter/material.dart';
import 'package:phamoclock/common/widgets/bottom_bar.dart';
import 'package:phamoclock/features/auth/screens/auth.dart';
import 'package:phamoclock/router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: (settings) => generateRoute(settings),
      debugShowCheckedModeBanner: false,
      home: const SafeArea(
        child: Scaffold(
          body: Center(
            child: BottomBar(),
          ),
        ),
      ),
    );
  }
}
