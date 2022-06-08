import 'package:chatapp/routes.dart';
import 'package:chatapp/screens/welcome/welcome_screen.dart';
import 'package:chatapp/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: lightThemeData(context),
      initialRoute: WelcomeScreen.routeName,
      routes: routes,
    );
  }
}
