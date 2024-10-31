import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Align(
        alignment: Alignment.topCenter,
        child: Container(
            margin: EdgeInsets.only(top: 120.0),
            child: Column(mainAxisSize: MainAxisSize.min, children: [
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
                    color: const Color.fromARGB(255, 17, 91, 151)),
              ),
              Text(
                "Sign to coninue",
                style: TextStyle(
                  color: Colors.grey.withOpacity(0.8),
                  fontSize: 20.0,
                ),
              ),
              SizedBox(height: 50.0),
              Container(
                  width: 350.0,
                  child: TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(
                                color: Colors.grey.withOpacity(0.3))),
                        labelText: 'EMAIL',
                        hintText: 'Enter Your email',
                        prefixIcon: Icon(
                          Icons.email_outlined,
                          color: Colors.cyan,
                        )),
                  )),
              SizedBox(height: 20.0),
              Container(
                  width: 350.0,
                  child: TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(
                                color: Colors.grey.withOpacity(0.3))),
                        labelText: 'PASSWORD',
                        hintText: 'Enter Your Password',
                        prefixIcon: Icon(
                          Icons.lock,
                          color: Colors.cyan,
                        )),
                  )),
              Padding(
                  padding: EdgeInsets.only(left: 240.0),
                  child: Container(
                    child: TextButton(
                        onPressed: () {},
                        child: Text(
                          'forget Password?',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: const Color.fromARGB(255, 0, 76, 138)),
                        )),
                  )),
              SizedBox(
                height: 20.0,
              ),
              SizedBox(
                width: 350.0,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    shape: BeveledRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5))),
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
                  Text('Don\'t have account?'),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/Signup');
                    },
                    child: Text(
                      'create a new account',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: const Color.fromARGB(255, 0, 76, 138)),
                    ),
                  )
                ],
              )
            ])),
      ),
    ));
  }
}
