import 'package:flutter/material.dart';

import 'bookmark.dart';
import 'home.dart';
import 'search.dart';
import 'settings.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> Pages = [
    Home(),
    Search(),
    Bookmarks(),
    Settings(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Color primaryColor = Theme.of(context).primaryColor;

    return Scaffold(
      body: Pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: primaryColor,
        unselectedItemColor: Colors.grey,
        selectedItemColor: primaryColor,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: [
          _buildNavBarItem(Icons.home, 0, ""),
          _buildNavBarItem(Icons.search, 1, ""),
          _buildNavBarItem(Icons.bookmark, 2, ""),
          _buildNavBarItem(Icons.person, 3, ""),
        ],
      ),
    );
  }

  BottomNavigationBarItem _buildNavBarItem(
      IconData icon, int index, String label) {
    Color primaryColor = Theme.of(context).primaryColor;
    Color secondaryColor = Theme.of(context).secondaryHeaderColor;

    return BottomNavigationBarItem(
      icon: Container(
        decoration: BoxDecoration(
          color: _selectedIndex == index ? secondaryColor : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.all(8),
        child: InkWell(
          onTap: () => _onItemTapped(index),
          child: Icon(
            icon,
            color: _selectedIndex == index ? primaryColor : Colors.grey,
          ),
        ),
      ),
      label: label,
    );
  }
}
