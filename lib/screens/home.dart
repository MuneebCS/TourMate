import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tourmate/widgets/custom_button.dart';
import 'package:tourmate/widgets/menu_bar.dart';

import '../widgets/one_bookmark.dart';

class Home extends StatefulWidget {
  Home({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final PageController _pageController = PageController(viewportFraction: 0.9);

  int selectedMenuIndex = 0;

  final List<Map<String, dynamic>> cities = [
    {
      'title': 'City1',
      'imageUrl': 'assets/images/B1.jpg',
      'location': 'Nevsehir Markiz Turkey',
      'rating': '4.5',
      'isOneBookmark': Icon(Icons.bookmark),
    },
    {
      'title': 'City2',
      'imageUrl': 'assets/images/B2.jpg',
      'location': 'Nevsehir Markiz Turkey',
      'rating': '4.5',
      'isOneBookmark': Icon(Icons.bookmark),
    },
    {
      'title': 'City3',
      'imageUrl': 'assets/images/B1.jpg',
      'location': 'Nevsehir Markiz Turkey',
      'rating': '4.5',
      'isOneBookmark': Icon(Icons.bookmark),
    },
  ];

  final List<Map<String, dynamic>> countries = [
    {
      'title': 'Country1',
      'imageUrl': 'assets/images/B1.jpg',
      'location': 'Nevsehir Markiz Turkey',
      'rating': '4.5',
      'isOneBookmark': Icon(Icons.bookmark),
    },
    {
      'title': 'Country2',
      'imageUrl': 'assets/images/B2.jpg',
      'location': 'Nevsehir Markiz Turkey',
      'rating': '4.5',
      'isOneBookmark': Icon(Icons.bookmark),
    },
    {
      'title': 'Country3',
      'imageUrl': 'assets/images/B1.jpg',
      'location': 'Nevsehir Markiz Turkey',
      'rating': '4.5',
      'isOneBookmark': Icon(Icons.bookmark),
    },
  ];

  final List<Map<String, dynamic>> destinations = [
    {
      'title': 'destination1',
      'imageUrl': 'assets/images/B1.jpg',
      'location': 'Nevsehir Markiz Turkey',
      'rating': '4.5',
      'isOneBookmark': Icon(Icons.bookmark),
    },
    {
      'title': 'destination2',
      'imageUrl': 'assets/images/B2.jpg',
      'location': 'Nevsehir Markiz Turkey',
      'rating': '4.5',
      'isOneBookmark': Icon(Icons.bookmark),
    },
    {
      'title': 'destination3',
      'imageUrl': 'assets/images/B1.jpg',
      'location': 'Nevsehir Markiz Turkey',
      'rating': '4.5',
      'isOneBookmark': Icon(Icons.bookmark),
    },
  ];

  void _scrollToNextPage() {
    if (_pageController.hasClients) {
      final int nextPage = _pageController.page!.toInt() + 1;
      if (nextPage < _getCurrentItems().length) {
        _pageController.animateToPage(
          nextPage,
          duration: Duration(milliseconds: 250),
          curve: Curves.easeInOut,
        );
      }
    }
  }

  void _onMenuItemSelected(int index) {
    setState(() {
      selectedMenuIndex = index;
    });
  }

  List<Map<String, dynamic>> _getCurrentItems() {
    switch (selectedMenuIndex) {
      case 0:
        return destinations;
      case 1:
        return countries;
      case 2:
        return cities;
      default:
        return cities;
    }
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 30, top: 25, right: 30),
              child: _buildHeader(context),
            ),
            Padding(
              padding: EdgeInsets.only(left: 30, top: 5, right: 25),
              child: _buildRecommendationRow(context),
            ),
            Padding(
              padding: EdgeInsets.only(left: 30, top: 5),
              child: Divider(thickness: 2),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MENUBAR(onMenuItemSelected: _onMenuItemSelected),
                  Expanded(
                    child: Center(
                      child: _buildPageView(screenWidth, context),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            _buildProfileButton(context),
            SizedBox(width: 5),
            _buildWelcomeText(),
          ],
        ),
        Icon(Icons.menu),
      ],
    );
  }

  Widget _buildProfileButton(BuildContext context) {
    return Container(
      width: 45,
      height: 40,
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(12),
        image: DecorationImage(
          image: AssetImage('assets/images/splash2.jpg'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildWelcomeText() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Welcome",
          style: GoogleFonts.roboto(fontSize: 10),
        ),
        SizedBox(height: 5),
        Text(
          "Evelyn",
          style: GoogleFonts.roboto(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget _buildRecommendationRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Recommendation",
          style: TextStyle(
            color: Theme.of(context).secondaryHeaderColor,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        IconButton(
          icon:
              Icon(Icons.search, color: Theme.of(context).secondaryHeaderColor),
          onPressed: () {
            // Handle search button press
          },
        ),
      ],
    );
  }

  Widget _buildPageView(double screenWidth, BuildContext context) {
    return PageView.builder(
      controller: _pageController,
      itemCount: _getCurrentItems().length,
      itemBuilder: (BuildContext context, int index) {
        final bookmark = _getCurrentItems()[index];
        return Padding(
          padding: EdgeInsets.only(
            left: index == 0 ? 0 : 5,
            right: index == _getCurrentItems().length - 1 ? 0 : 5,
          ),
          child: OneBookmark(
            title: bookmark['title'],
            imageUrl: bookmark['imageUrl'],
            location: bookmark['location'],
            rating: bookmark['rating'],
            customButton: index < _getCurrentItems().length - 1
                ? _buildNextButton(screenWidth, context)
                : null,
            isOneBookmark: bookmark['isOneBookmark'],
          ),
        );
      },
    );
  }

  CustomButton _buildNextButton(double screenWidth, BuildContext context) {
    return CustomButton(
      C_height: 50,
      C_width: screenWidth * 0.3,
      Col: Colors.transparent,
      onPress: _scrollToNextPage,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(18),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                child: Container(
                  color:
                      Theme.of(context).secondaryHeaderColor.withOpacity(0.2),
                ),
              ),
            ),
            Icon(
              Icons.arrow_forward,
              color: Theme.of(context).secondaryHeaderColor,
            ),
          ],
        ),
      ),
    );
  }
}
