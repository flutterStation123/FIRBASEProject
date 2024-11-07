import 'package:flutter/material.dart';
import 'package:groupproject/Styles/BottomNavigationBar.dart';

class BaseScaffold extends StatelessWidget {
  final Widget body;

  const BaseScaffold({Key? key, required this.body}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body,
      bottomNavigationBar: const CustomBottomNavigationBar(),
    );
  }
}
