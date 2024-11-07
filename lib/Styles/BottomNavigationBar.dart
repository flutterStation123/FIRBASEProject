import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({Key? key}) : super(key: key);

  @override
  _CustomBottomNavigationBarState createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int _selectedIndex = 0; // Track the selected index

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        Navigator.pushNamed(context, '/home'); // Replace with your home route
        break;
      case 1: // Favorites
        Navigator.pushNamed(context, '/favorites');
        break;
      case 2: // Search
        Navigator.pushNamed(context, '/search');
        break;
      case 3: // Settings
        Navigator.pushNamed(context, '/Profile');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: _selectedIndex, // Set the currently selected index
      onTap: _onItemTapped, // Handle tap
      items: [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home_outlined,
            color: _selectedIndex == 0
                ? const Color.fromARGB(255, 250, 4, 119) // Active color
                : Colors.grey, // Inactive color
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.favorite,
            color: _selectedIndex == 1
                ? const Color.fromARGB(255, 250, 4, 119) // Active color
                : Colors.grey, // Inactive color
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.search,
            color: _selectedIndex == 2
                ? const Color.fromARGB(255, 250, 4, 119) // Active color
                : Colors.grey, // Inactive color
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.settings,
            color: _selectedIndex == 3
                ? const Color.fromARGB(255, 250, 4, 119) // Active color
                : Colors.grey, // Inactive color
          ),
          label: '',
        ),
      ],
    );
  }
}
