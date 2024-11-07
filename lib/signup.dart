import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => signupState();
}

class signupState extends State<Signup> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _username = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  Future<void> signup() async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: _email.text,
            password: _password.text,
          );
          Navigator.of(context).pushReplacementNamed('homePage');
        } on FirebaseAuthException catch (e) {
          if (e.code == 'weak-password') {
          print('The password provided is too weak.');
          } 
          else if (e.code == 'email-already-in-use') {
            print('The account already exists for that email.');
          }
          } catch (e) {
            print(e);
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Une erreur est survenue')),
      );
    }
  }

  @override
  void initState() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        print('=========User is currently signed out!');
      } else {
        print('==========User is signed in!');
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Future<void> addUser () {
       return users
          .add({
            'username': _username.text, // John Doe
            'email': _email.text, // Stokes and Sons
            'password': _password.text // 42
          })
          .then((value) => print("User Added"))
          .catchError((error) => print("Failed to add user: $error"));
    }
    
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 20),
            TextFormField(
              controller: _username,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Username'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Veuillez entrer votre Nom';
                }
                return null;
              },
            ),
          const SizedBox(height: 20),
            TextFormField(
              controller: _email,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), labelText: 'E-mail'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Veuillez entrer votre E-mail';
                }
                return null;
              },
            ),
          const SizedBox(height: 20),
            TextFormField(
              controller: _password,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Mot de passe'),
              obscureText: true,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Veuillez entrer votre mot de passe';
                }
                return null;
              },
            ),
          const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                // if (_formKey.currentState!.validate()) {
                  await addUser();
                // }
              },
              child: const Text('Se connecter'),
            ),
          const SizedBox(height: 20),
            TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/login');
                },
                child: const Text('Si vous avez deja un compte. Connecter'),
                style: ButtonStyle()),
        ],
      ),
    );
  }
}

