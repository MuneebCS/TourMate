import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tourmate/widgets/custom_button.dart';
import 'package:tourmate/widgets/menu_bar.dart';
import '../widgets/city_view.dart';
import '../widgets/country_view.dart';
import '../widgets/destination_view.dart';

class Home extends StatefulWidget {
  Home({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final PageController _pageController = PageController(viewportFraction: 0.9);

  int selectedMenuIndex = 0;
  bool isSearchTapped = false;
  List<OneCity> cities = [
    OneCity(
        title: 'Aragua',
        imageUrl: 'assets/images/B1.jpg',
        location: 'Nevsehir Markiz Turkey',
        rating: '4.5',
        isOneCity: const Icon(Icons.bookmark)),
    OneCity(
        title: 'London',
        imageUrl: 'assets/images/B1.jpg',
        location: 'Nevsehir Markiz Turkey',
        rating: '4.5',
        isOneCity: const Icon(Icons.bookmark)),
    OneCity(
        title: 'Paris',
        imageUrl: 'assets/images/B1.jpg',
        location: 'Nevsehir Markiz Turkey',
        rating: '4.5',
        isOneCity: const Icon(Icons.bookmark)),
  ];

  List<OneDestination> destinations = [
    OneDestination(
        title: 'Aragua',
        imageUrl: 'assets/images/B1.jpg',
        location: 'Nevsehir Markiz Turkey',
        rating: '4.5',
        isOneDestination: const Icon(Icons.bookmark)),
    OneDestination(
        title: 'Aragua',
        imageUrl: 'assets/images/B1.jpg',
        location: 'Nevsehir Markiz Turkey',
        rating: '4.5',
        isOneDestination: const Icon(Icons.bookmark)),
    OneDestination(
        title: 'Aragua',
        imageUrl: 'assets/images/B1.jpg',
        location: 'Nevsehir Markiz Turkey',
        rating: '4.5',
        isOneDestination: const Icon(Icons.bookmark)),
  ];

  List<OneCountry> countries = [
    OneCountry(
        title: 'Aragua',
        imageUrl: 'assets/images/B1.jpg',
        location: 'Nevsehir Markiz Turkey',
        rating: '4.5',
        isOneCountry: const Icon(Icons.bookmark)),
    OneCountry(
        title: 'Aragua',
        imageUrl: 'assets/images/B1.jpg',
        location: 'Nevsehir Markiz Turkey',
        rating: '4.5',
        isOneCountry: const Icon(Icons.bookmark)),
    OneCountry(
        title: 'Aragua',
        imageUrl: 'assets/images/B1.jpg',
        location: 'Nevsehir Markiz Turkey',
        rating: '4.5',
        isOneCountry: const Icon(Icons.bookmark)),
  ];

  void _scrollToNextPage() {
    if (_pageController.hasClients) {
      final int nextPage = _pageController.page!.toInt() + 1;
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

  List<dynamic> _getCurrentItems() {
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
              padding: const EdgeInsets.only(left: 30, top: 25, right: 30),
              child: _buildHeader(context),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, top: 5, right: 30),
              child: isSearchTapped
                  ? _buildTextField(context)
                  : _buildRecommendationRow(context),
            ),
            const Padding(
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
          style: GoogleFonts.roboto(fontSize: 10),
        ),
        const SizedBox(height: 5),
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
        GestureDetector(
          child: SvgPicture.asset(
            'assets/icons/search.svg',
            color: Theme.of(context).secondaryHeaderColor,
          ),
          onTap: () {},
        ),
      ],
    );
  }

  Widget _buildTextField(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextField(),
        Icon(Icons.crop_sharp),
      ],
    );
  }

  Widget _buildPageView(double screenWidth, BuildContext context) {
    return PageView.builder(
      controller: _pageController,
      itemCount: _getCurrentItems().length,
      itemBuilder: (BuildContext context, int index) {
        final currentitem = _getCurrentItems()[index];

        // Determine the appropriate widget to use based on the selected menu index
        if (selectedMenuIndex == 0) {
          // Destinations
          final destination = currentitem as OneDestination;
          return Padding(
            padding: EdgeInsets.only(
              left: index == 0 ? 0 : 5,
              right: index == _getCurrentItems().length - 1 ? 0 : 5,
            ),
            child: OneDestination(
              title: destination.title,
              imageUrl: destination.imageUrl,
              location: destination.location,
              rating: destination.rating,
              customButton: index < _getCurrentItems().length - 1
                  ? _buildNextButton(screenWidth, context)
                  : null,
              isOneDestination: destination.isOneDestination,
            ),
          );
        } else if (selectedMenuIndex == 1) {
          // Countries
          final country = currentitem as OneCountry;
          return Padding(
            padding: EdgeInsets.only(
              left: index == 0 ? 0 : 5,
              right: index == _getCurrentItems().length - 1 ? 0 : 5,
            ),
            child: OneCountry(
              title: country.title,
              imageUrl: country.imageUrl,
              location: country.location,
              rating: country.rating,
              customButton: index < _getCurrentItems().length - 1
                  ? _buildNextButton(screenWidth, context)
                  : null,
              isOneCountry: country.isOneCountry,
            ),
          );
        } else if (selectedMenuIndex == 2) {
          // Cities
          final city = currentitem as OneCity;
          return Padding(
            padding: EdgeInsets.only(
              left: index == 0 ? 0 : 5,
              right: index == _getCurrentItems().length - 1 ? 0 : 5,
            ),
            child: OneCity(
              title: city.title,
              imageUrl: city.imageUrl,
              location: city.location,
              rating: city.rating,
              customButton: index < _getCurrentItems().length - 1
                  ? _buildNextButton(screenWidth, context)
                  : null,
              isOneCity: city.isOneCity,
            ),
          );
        } else {
          return Container(); // Fallback case
        }
      },
    );
  }

  CustomButton _buildNextButton(double screenWidth, BuildContext context) {
    return CustomButton(
      c_height: 50,
      c_width: screenWidth * 0.3,
      col: Colors.transparent,
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
