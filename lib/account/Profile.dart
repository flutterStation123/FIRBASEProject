import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:groupproject/Styles/Customswidgets.dart';

class SettingsPage2 extends StatefulWidget {
  const SettingsPage2({Key? key}) : super(key: key);

  @override
  State<SettingsPage2> createState() => _SettingsPage2State();
}

class _SettingsPage2State extends State<SettingsPage2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 30.0),
            const CustomProfileCard(
              imageUrl: 'assets/will_smith.png',
              name: 'Will Smith',
              subtitle: 'Famous Actor',
            ),
            Container(
              constraints: const BoxConstraints(maxWidth: 400),
              child: ListView(
                shrinkWrap: true,
                children: [
                  SingleSection(
                    children: [
                      CustomListTile(
                        title: "Persenal Data",
                        icon: Icons.person,
                        trailing: Icon(Icons.keyboard_arrow_right),
                        onTap: () {
                          Navigator.pushReplacementNamed(
                              context, '/Personalinfo');
                        },
                      ),
                      CustomListTile(
                        title: "Settings",
                        icon: Icons.settings,
                        trailing: Icon(Icons.keyboard_arrow_right),
                      ),
                      CustomListTile(
                        title: "E-Statement",
                        icon: CupertinoIcons.doc_text_fill,
                        trailing: Icon(Icons.keyboard_arrow_right),
                      ),
                      CustomListTile(
                        title: "Rafferal Code",
                        icon: CupertinoIcons.heart_fill,
                        trailing: Icon(Icons.keyboard_arrow_right),
                      ),
                    ],
                  ),
                  Divider(),
                  SingleSection(
                    children: [
                      CustomListTile(
                        title: "FAQs",
                        icon: Icons.more_horiz,
                        trailing: Icon(Icons.keyboard_arrow_right),
                      ),
                      CustomListTile(
                        title: "Our HandBook",
                        icon: Icons.edit,
                        trailing: Icon(Icons.keyboard_arrow_right),
                      ),
                      CustomListTile(
                        title: "Community",
                        icon: Icons.people,
                        trailing: Icon(Icons.keyboard_arrow_right),
                        onTap: () {
                          Navigator.pushReplacementNamed(context, '/Community');
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30.0),
            const CustomIconCard(
              description: 'Feel Free to Ask,We Ready to Help',
              backgroundColor: Color.fromRGBO(126, 206, 243, 0.353),
              textColor: Color.fromARGB(197, 37, 151, 204),
              iconColor: Color.fromARGB(197, 37, 151, 204),
              icon: Icons.headset_mic_outlined,
            ),
          ],
        ),
      ),
    );
  }
}
