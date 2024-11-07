// ignore_for_file: undefined_hidden_name

import 'package:flutter/material.dart';
import 'package:groupproject/auth/signup.dart' hide firebase_auth;
import 'package:groupproject/page.dart';
import 'auth/signin.dart' hide firebase_auth;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(apiKey: "AIzaSyD4L-ToU50N5bv1I-O5JQASwl8B2V0pGvY", appId: "com.example.groupproject", messagingSenderId: "messagingSenderId", projectId: "flutterapp-72534")
  );
  runApp(const MyApp());
}


class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
     routes: {
      '/homepage' : (context) =>  HomePage(),
      '/signup' :(context) => Signup(),
      '/signin' :(context) => Signin(),
      //'/productdestaile' : (context) => ProductDetails(),
      // '/panier' : (context) => Panier(),
      //'/profil' : (context) => Profil(),
      }
    );
  }
}
