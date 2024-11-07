import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:groupproject/Styles/BaseScaffold.dart';
import 'package:groupproject/account/Community.dart';
import 'package:groupproject/account/PersenalData.dart';
import 'package:groupproject/account/Profile.dart';
import 'package:groupproject/auth/SignupPage.dart';
import 'package:groupproject/auth/loginPage.dart';
import 'package:groupproject/singin.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: 'AIzaSyD4L-ToU50N5bv1I-O5JQASwl8B2V0pGvY',
          appId: 'com.example.groupproject',
          messagingSenderId: '853158227682',
          projectId: 'flutterapp-72534'));

  runApp(MyApp());
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
        home: CommunityPage(),
        routes: {
          '/login': (context) => LoginPage(),
          '/Signup': (context) => SignupPage(),
          '/Profile': (context) => const BaseScaffold(body: SettingsPage2()),
          '/Personalinfo': (context) => PersonalDataScreen(),
          '/Community': (context) => CommunityPage(),
        });
  }

  @override
  void initState() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        print('User is signed in!');
      }
    });
    super.initState();
  }
}