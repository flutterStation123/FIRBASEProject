import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Signin extends StatefulWidget {
  const Signin({super.key});

  @override
  State<Signin> createState() => signinState();
}

class signinState extends State<Signin> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Future<void> signup() async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _email.text, password: _password.text);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 20),
          TextFormField(
            controller: _email,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'E-mail',
            ),
          ),
          const SizedBox(height: 10),
          TextFormField(
            controller: _password,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'password',
            ),
            obscureText: true,
          ),
          const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () async {
            if (_formKey.currentState!.validate()) {
              Signin();
            }
          },
          child: const Text('Se connecter'),
        ),
        ],
      ),
    );
  }
}
