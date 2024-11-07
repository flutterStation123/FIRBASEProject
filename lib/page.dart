import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:groupproject/listofProduct.dart';

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
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(builder: (BuildContext context) {
          return IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          );
        }),
        actions: [
          IconButton(
            //decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(8)),
            onPressed: () {
              Navigator.pushNamed(context, '/signin');
            },
            icon: const Icon(Icons.person, color: Colors.black,),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: const [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 209, 109, 109),
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            )
          ],
        ),
      ),
      body: const Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(16.0),
          child: Row(
            children: [
              const Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search...',
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              IconButton(
                icon: const Icon(Icons.shopping_cart),
                onPressed: () {
                  Navigator.pushNamed(context, '/signup');
                },
              ),
            ],
          ),
        ),
        
        const Row(
          children: [
            Text.rich(
              TextSpan(
                text: 'Explore',
                style: TextStyle(fontWeight: FontWeight.bold)
              ),
            )
          ],
        ),
        SizedBox(
          height: 250,
          child: ListOfProducts(),
        ),
        const Text.rich(
          TextSpan(text: 'Best Selling',
          style: TextStyle(fontWeight: FontWeight.bold)
          ),
        ),
        // SizedBox(height: 150,),
         Card(
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Container(
          padding:  EdgeInsets.all(14),
          width: 450,
          child: Row(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Image.asset("images/chair.jpg", height: 120, width: 120, fit: BoxFit.cover),
                  const Positioned(
                    top: 8,
                    right: 8,
                    child: Icon(
                      Icons.favorite_border,
                      color: Colors.red,
                      size: 24,
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 20),
              Column(
                children: [
                  const Text(
                  "Chair",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    fontFamily: 'Poppins',
                  ),
                  ),
                Row(
                  children:[ 
                    const Text(
                      "\$80.000",
                      style:  TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    Positioned(
                      right: 8,
                      child: IconButton(
                        icon : const Icon(Icons.arrow_forward,
                        color: Color.fromARGB(255, 0, 0, 0),
                        size: 22),
                        onPressed: () { 
                        //  Navigator.pushNamed(context, '/panier');
                       },
                      ),  
                    ),
                  ],
                )
                ]
              )
            ],  
          ),
        ),
      )
     ],
    );
  }
}
