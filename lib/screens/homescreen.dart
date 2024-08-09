import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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

  final List<Widget> pages = [
    const Home(),
    const Search(),
    const Bookmarks(),
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
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: primaryColor,
        unselectedItemColor: Colors.grey,
        selectedItemColor: primaryColor,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: [
          _buildNavBarItem('assets/icons/home.svg', 0, ""),
          _buildNavBarItem('assets/icons/search.svg', 1, ""),
          _buildNavBarItem('assets/icons/bookmark.svg', 2, ""),
          _buildNavBarItem('assets/icons/settings.svg', 3, ""),
        ],
      ),
    );
  }

  BottomNavigationBarItem _buildNavBarItem(
      String iconPath, int index, String label) {
    Color primaryColor = Theme.of(context).primaryColor;
    Color secondaryColor = Theme.of(context).secondaryHeaderColor;

    return BottomNavigationBarItem(
      icon: Container(
        decoration: BoxDecoration(
          color: _selectedIndex == index ? secondaryColor : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.all(12),
        child: InkWell(
            onTap: () => _onItemTapped(index),
            child: SvgPicture.asset(
              iconPath,
              colorFilter: ColorFilter.mode(
                  _selectedIndex == index ? primaryColor : Colors.grey,
                  BlendMode.srcIn),
              height: 24,
              width: 24,
            )),
      ),
      label: label,
    );
  }
}
