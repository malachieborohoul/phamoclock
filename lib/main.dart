import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:phamoclock/features/intro/screens/splash_screen.dart';
import 'package:phamoclock/firebase_options.dart';
import 'package:phamoclock/providers/user_provider.dart';
import 'package:phamoclock/router.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => UserProvider())],
      child: MaterialApp(
        title: 'Phamoclock',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        onGenerateRoute: (settings) => generateRoute(settings),
        debugShowCheckedModeBanner: false,
        home: const SplashScreen(),
    ));
  }
}

//     Scaffold(
        //   body: Container(
        //     child: Center(
        //         child: StreamBuilder(
        //             stream: FirebaseAuth.instance.authStateChanges(),
        //             builder: (context, snapshot) {
        //               if (snapshot.connectionState == ConnectionState.active) {
        //                 if (snapshot.hasData) {
        //                   return const BottomBar();
        //                 } else if (snapshot.hasError) {
        //                   return Center(
        //                     child: Text("${snapshot.error}"),
        //                   );
        //                 }
        //               }
        //               if (snapshot.connectionState == ConnectionState.waiting) {
        //                 return Loader();
        //               }
        //               return AuthScreen();
        //             })),
        //   ),
        // )),