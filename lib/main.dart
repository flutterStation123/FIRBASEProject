import 'package:flutter/material.dart';
import 'package:groupproject/auth/SignupPage.dart';
import 'package:groupproject/auth/loginPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: LoginPage(),
        routes: {
          '/login': (context) => LoginPage(),
          '/Signup': (context) => SignupPage(),
        });
  }
}
