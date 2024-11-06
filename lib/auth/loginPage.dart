import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:groupproject/singin.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final AuthService _authService = AuthService();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final GlobalKey<FormState> _formKey =
      GlobalKey<FormState>(); // Form key for validation

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Align(
          alignment: Alignment.topCenter,
          child: Container(
            margin: EdgeInsets.only(top: 120.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  "assets/popsickel.png",
                  fit: BoxFit.cover,
                  height: 140,
                ),
                Text(
                  "Welcome Back",
                  style: TextStyle(
                    fontSize: 40.0,
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(255, 17, 91, 151),
                  ),
                ),
                Text(
                  "Sign in to continue",
                  style: TextStyle(
                    color: Colors.grey.withOpacity(0.8),
                    fontSize: 20.0,
                  ),
                ),
                SizedBox(height: 50.0),
                Form(
                  key: _formKey, // Attach the form key
                  child: Column(
                    children: [
                      Container(
                        width: 350.0,
                        child: TextFormField(
                          controller: _email,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: BorderSide(
                                color: Colors.grey.withOpacity(0.3),
                              ),
                            ),
                            labelText: 'EMAIL',
                            hintText: 'Enter Your email',
                            prefixIcon: Icon(
                              Icons.email_outlined,
                              color: Colors.cyan,
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your email';
                            }
                            // Add email format validation if needed
                            return null;
                          },
                        ),
                      ),
                      SizedBox(height: 20.0),
                      Container(
                        width: 350.0,
                        child: TextFormField(
                          controller: _password,
                          obscureText: true,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: BorderSide(
                                color: Colors.grey.withOpacity(0.3),
                              ),
                            ),
                            labelText: 'PASSWORD',
                            hintText: 'Enter Your Password',
                            prefixIcon: Icon(
                              Icons.lock,
                              color: Colors.cyan,
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your password';
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 240.0),
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      'Forgot Password?',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: const Color.fromARGB(255, 0, 76, 138),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                SizedBox(
                  width: 350.0,
                  child: ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        // Call signIn only if validation passes
                        await _authService.signIn(
                          _email.text,
                          _password.text,
                          context,
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      shape: BeveledRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      backgroundColor: Color.fromARGB(255, 7, 97, 172),
                    ),
                    child: const Text(
                      "LOGIN",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Don\'t have an account?'),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/Signup');
                      },
                      child: Text(
                        'Create a new account',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: const Color.fromARGB(255, 0, 76, 138),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
