import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User?> signIn(String email, String password) async {
    try {
      final credential = await _auth.signInWithEmailAndPassword(
          email: email, 
          password: password
          );
          print("credential");
      return credential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
      return null;
    } catch (e) {
      print("Erreur lors de la connexion : $e");
      return null;
    }
  }
}

class Signin extends StatefulWidget {
  const Signin({super.key});

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final AuthService _authService = AuthService();

  @override
  void initState() {
    super.initState();
    // Écoute l'état de connexion de l'utilisateur
    FirebaseAuth.instance.userChanges().listen((User? user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        Navigator.of(context).pushNamed('home');
        print('User is signed in!');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.fingerprint,
                size: 80,
                color: Colors.blue,
              ),
              const SizedBox(height: 20),
              const Text(
                'Welcome Back',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Sign in to continue',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 40),
              TextField(
                controller: _email,
                decoration: InputDecoration(
                  labelText: 'E-MAIL',
                  prefixIcon: const Icon(Icons.email, color: Colors.blue),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _password,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'PASSWORD',
                  prefixIcon: const Icon(Icons.lock, color: Colors.blue),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    // Ajoutez ici la logique pour "Mot de passe oublié"
                  },
                  child: const Text(
                    'Forgot Password?',
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  String email = _email.text;
                  String password = _password.text;
                  var user = await _authService.signIn(email, password);
                  print(user);
                  if (user != null) {
                    Navigator.of(context).pushNamed('/homepage');
                    print("Connecté : ${user.email}");
                  } else {
                    print("Erreur lors de la connexion");
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  'LOGIN',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an account?"),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('/signup');
                    },
                    child: const Text(
                      'Create a new account',
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
