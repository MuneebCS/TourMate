import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tourmate/widgets/custom_button.dart';
import 'package:tourmate/widgets/menu_bar.dart';
import '../widgets/city_view.dart';
import '../widgets/country_view.dart';
import '../widgets/destination_view.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final PageController _pageController = PageController(viewportFraction: 0.9);

  int selectedMenuIndex = 0;

  // TODO: save data using classes
  final List<Map<String, dynamic>> cities = [
    {
      'title': 'Aragua',
      'imageUrl': 'assets/images/B1.jpg',
      'location': 'Nevsehir Markiz Turkey',
      'rating': '4.5',
      'isOneBookmark': const Icon(Icons.bookmark),
    },
    {
      'title': 'Paris',
      'imageUrl': 'assets/images/B2.jpg',
      'location': 'Nevsehir Markiz Turkey',
      'rating': '4.5',
      'isOneBookmark': const Icon(Icons.bookmark),
    },
    {
      'title': 'London',
      'imageUrl': 'assets/images/B1.jpg',
      'location': 'Nevsehir Markiz Turkey',
      'rating': '4.5',
      'isOneBookmark': const Icon(Icons.bookmark),
    },
  ];

// TODO: save data using classes
  final List<Map<String, dynamic>> countries = [
    {
      'title': 'Indonesia',
      'imageUrl': 'assets/images/B1.jpg',
      'location': 'Nevsehir Markiz Turkey',
      'rating': '4.5',
      'isOneBookmark': const Icon(Icons.bookmark),
    },
    {
      'title': 'Japan',
      'imageUrl': 'assets/images/B2.jpg',
      'location': 'Nevsehir Markiz Turkey',
      'rating': '4.5',
      'isOneBookmark': const Icon(Icons.bookmark),
    },
    {
      'title': 'South korea',
      'imageUrl': 'assets/images/B1.jpg',
      'location': 'Nevsehir Markiz Turkey',
      'rating': '4.5',
      'isOneBookmark': const Icon(Icons.bookmark),
    },
  ];

// TODO: save data using classes

  final List<Map<String, dynamic>> destinations = [
    {
      'title': 'Borobudur Temple',
      'imageUrl': 'assets/images/B1.jpg',
      'location': 'Nevsehir Markiz Turkey',
      'rating': '4.5',
      'isOneBookmark': const Icon(Icons.bookmark),
    },
    {
      'titlee': 'Zion National Park',
      'imageUrl': 'assets/images/B2.jpg',
      'location': 'Nevsehir Markiz Turkey',
      'rating': '4.5',
      'isOneBookmark': const Icon(Icons.bookmark),
    },
    {
      'title': 'Serengi',
      'imageUrl': 'assets/images/B1.jpg',
      'location': 'Nevsehir Markiz Turkey',
      'rating': '4.5',
      'isOneBookmark': const Icon(Icons.bookmark),
    },
  ];

  // remove force unwrapping
  void _scrollToNextPage() {
    if (_pageController.hasClients) {
      final int nextPage = (_pageController.page ?? 0.0).toInt() + 1;
      if (nextPage < _getCurrentItems().length) {
        _pageController.animateToPage(
          nextPage,
          duration: const Duration(milliseconds: 250),
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
              padding: const EdgeInsets.only(
                  left: 20.0, right: 20, top: 20, bottom: 10),
              child: Column(
                children: [
                  _buildHeader(context),
                  const SizedBox(
                    height: 12,
                  ),
                  _buildRecommendationRow(context),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 30, bottom: 20),
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
            const SizedBox(width: 5),
            _buildWelcomeText(),
          ],
        ),
        const Icon(Icons.menu),
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
        image: const DecorationImage(
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
          style:
              GoogleFonts.montserrat(fontSize: 12, fontWeight: FontWeight.w500),
        ),
        Text(
          "Evelyn",
          style:
              GoogleFonts.montserrat(fontSize: 22, fontWeight: FontWeight.bold),
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
          style: GoogleFonts.montserrat(
            color: Theme.of(context).secondaryHeaderColor,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        GestureDetector(
          onTap: () {},
          child: Image.asset(
            'assets/icons/search.png',
            width: 24,
          ),
        )
        // IconButton(
        //   icon: ImageIcon(
        //     const AssetImage('assets/icons/search.png'),
        //     color: Theme.of(context).secondaryHeaderColor,
        //   ),
        //   onPressed: () {},
        // ),
      ],
    );
  }

  Widget _buildPageView(double screenWidth, BuildContext context) {
    return PageView.builder(
      controller: _pageController,
      itemCount: _getCurrentItems().length,
      itemBuilder: (BuildContext context, int index) {
        final bookmark = _getCurrentItems()[index];

        // Determine the appropriate widget to use based on the selected menu index
        if (selectedMenuIndex == 0) {
          // Destinations
          return Padding(
            padding: EdgeInsets.only(
              left: index == 0 ? 0 : 5,
              right: index == _getCurrentItems().length - 1 ? 0 : 5,
            ),
            child: OneDestination(
              title: bookmark['title'],
              imageUrl: bookmark['imageUrl'],
              location: bookmark['location'],
              rating: bookmark['rating'],
              customButton: index < _getCurrentItems().length - 1
                  ? _buildNextButton(screenWidth, context)
                  : null,
              isOneDestination: bookmark['isOneBookmark'],
            ),
          );
        } else if (selectedMenuIndex == 1) {
          // Countries
          return Padding(
            padding: EdgeInsets.only(
              left: index == 0 ? 0 : 5,
              right: index == _getCurrentItems().length - 1 ? 0 : 5,
            ),
            child: OneCountry(
              title: bookmark['title'],
              imageUrl: bookmark['imageUrl'],
              location: bookmark['location'],
              rating: bookmark['rating'],
              customButton: index < _getCurrentItems().length - 1
                  ? _buildNextButton(screenWidth, context)
                  : null,
              isOneCountry: bookmark['isOneBookmark'],
            ),
          );
        } else if (selectedMenuIndex == 2) {
          // Cities
          return Padding(
            padding: EdgeInsets.only(
              left: index == 0 ? 0 : 5,
              right: index == _getCurrentItems().length - 1 ? 0 : 5,
            ),
            child: OneCity(
              title: bookmark['title'],
              imageUrl: bookmark['imageUrl'],
              location: bookmark['location'],
              rating: bookmark['rating'],
              customButton: index < _getCurrentItems().length - 1
                  ? _buildNextButton(screenWidth, context)
                  : null,
              isOneCity: bookmark['isOneBookmark'],
            ),
          );
        }
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
