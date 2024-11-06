import 'package:flutter/material.dart';
import 'package:groupproject/Styles/Customswidgets.dart';

class CommunityPage extends StatefulWidget {
  const CommunityPage({Key? key}) : super(key: key);

  @override
  State<CommunityPage> createState() => _CommunityPageState();
}

class _CommunityPageState extends State<CommunityPage> {
  bool _isHovered = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/Profile');
          },
        ),
        centerTitle: true,
        title: const Text(
          'Community',
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 1, 59, 107),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                child: const Column(
                  children: [
                    Text(
                      'Learn Stock,',
                      style: TextStyle(
                        fontSize: 35.0,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 1, 59, 107),
                      ),
                    ),
                    Text(
                      'Educate the World',
                      style: TextStyle(
                        fontSize: 35.0,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 1, 59, 107),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 40.0, right: 40.0),
                child: MouseRegion(
                  onEnter: (_) => setState(() => _isHovered = true),
                  onExit: (_) => setState(() => _isHovered = false),
                  cursor: SystemMouseCursors.click, // Sets cursor on hover
                  child: Stack(
                    alignment: Alignment.centerLeft,
                    children: [
                      TextFormField(
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color.fromARGB(255, 1, 59, 107),
                          fontWeight: FontWeight.bold,
                        ),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Color.fromARGB(255, 227, 232, 255),
                          hintText: 'Search something...',
                          hintStyle: TextStyle(
                            color: Color.fromARGB(255, 1, 59, 107)
                                .withOpacity(0.6),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(
                              color: Color.fromARGB(255, 57, 96, 253),
                              width: 2.0,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(
                              color: Color.fromARGB(255, 136, 158, 245),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(color: Colors.blueAccent),
                          ),
                          contentPadding: EdgeInsets.symmetric(vertical: 20.0),
                        ),
                      ),
                      AnimatedPositioned(
                        duration: Duration(milliseconds: 300),
                        left: _isHovered
                            ? MediaQuery.of(context).size.width / 2 - 40
                            : 12.0,
                        child: Icon(
                          Icons.search,
                          color: Color.fromARGB(255, 1, 59, 107),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              CustomPostCard(
                backgroundColor: Color.fromARGB(221, 227, 232, 255),
                images: [
                  'assets/will_smith.png',
                  'assets/will_smith.png',
                  'assets/will_smith.png',
                ],
                title: 'How to Start Investing in uStock',
                subtitle:
                    'lemme tell you this,world of investing is really really legit,especially using uStock why Beacuse it has so much potential',
              ),
              SizedBox(
                height: 20.0,
              ),
              CustomPostCard(
                backgroundColor: Color.fromARGB(221, 227, 232, 255),
                images: [
                  'assets/will_smith.png',
                  'assets/will_smith.png',
                  'assets/will_smith.png',
                ],
                title: 'How to Start Investing in uStock',
                subtitle:
                    'lemme tell you this,world of investing is really really legit,especially using uStock why Beacuse it has so much potential',
              ),
              SizedBox(
                height: 20.0,
              ),
              CustomPostCard(
                backgroundColor: Color.fromARGB(221, 227, 232, 255),
                images: [
                  'assets/will_smith.png',
                  'assets/will_smith.png',
                  'assets/will_smith.png',
                ],
                title: 'How to Start Investing in uStock',
                subtitle:
                    'lemme tell you this,world of investing is really really legit,especially using uStock why Beacuse it has so much potential',
              ),
              SizedBox(
                height: 20.0,
              ),
              CustomPostCard(
                backgroundColor: Color.fromARGB(221, 227, 232, 255),
                images: [
                  'assets/will_smith.png',
                  'assets/will_smith.png',
                  'assets/will_smith.png',
                ],
                title: 'How to Start Investing in uStock',
                subtitle:
                    'lemme tell you this,world of investing is really really legit,especially using uStock why Beacuse it has so much potential',
              ),
              SizedBox(
                height: 20.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
