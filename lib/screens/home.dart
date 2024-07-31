import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tourmate/screens/settings.dart';
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
      imageUrl: 'assets/images/splash1.jpg',
      location: 'Aragua, Venezuela',
      noOfDest: 12.0,
    ),
    OneCity(
      title: 'London',
      imageUrl: 'assets/images/splash2.jpg',
      location: 'London, United Kingdom',
      noOfDest: 12.0,
    ),
    OneCity(
      title: 'Paris',
      imageUrl: 'assets/images/splash3.jpg',
      location: 'Paris, France',
      noOfDest: 12.0,
    ),
  ];

  List<OneDestination> destinations = [
    OneDestination(
      title: 'Pamukkale',
      imageUrl: 'assets/images/splash4.jpg',
      location: 'Denizli, Turkey',
      rating: '4.5',
      isOneDestination: const Icon(Icons.bookmark),
    ),
    OneDestination(
      title: 'Pyramids of Giza',
      imageUrl: 'assets/images/splash5.jpg',
      location: 'Giza, Egypt',
      rating: '4.5',
      isOneDestination: const Icon(Icons.bookmark),
    ),
    OneDestination(
      title: 'Aragua',
      imageUrl: 'assets/images/B1.jpg',
      location: 'Aragua, Venezuela',
      rating: '4.5',
      isOneDestination: const Icon(Icons.bookmark),
    ),
  ];

  List<OneCountry> countries = [
    OneCountry(
      title: 'Indonesia',
      imageUrl: 'assets/images/B1.jpg',
      location: 'Indonesia',
      noOfDest: 112.0,
    ),
    OneCountry(
      title: 'New York',
      imageUrl: 'assets/images/B2.jpg',
      location: 'New York, USA',
      noOfDest: 120.0,
    ),
    OneCountry(
      title: 'England',
      imageUrl: 'assets/images/splash5.jpg',
      location: 'England, United Kingdom',
      noOfDest: 72.0,
    ),
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
        drawer: Drawer(
          elevation: 16,
          semanticLabel: 'Settings Drawer',
          width: screenWidth * 0.75,
          child: Settings(),
        ),
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
                  ? Padding(
                      padding: const EdgeInsets.only(top: 12),
                      child: _buildTextField(context),
                    )
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
        Builder(
          builder: (context) {
            return GestureDetector(
              child: const Icon(Icons.menu),
              onTap: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
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
          onTap: () {
            setState(() {
              isSearchTapped = !isSearchTapped;
            });
          },
        ),
      ],
    );
  }

  Widget _buildTextField(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: SizedBox(
            height: 30,
            child: TextField(
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.only(bottom: 15),
                hintText: 'Search your dream destination',
                hintStyle: GoogleFonts.montserrat(
                    color: Theme.of(context).secondaryHeaderColor,
                    fontSize: 15),
                border: InputBorder.none,
              ),
              style: GoogleFonts.montserrat(
                  color: Theme.of(context).secondaryHeaderColor),
              cursorColor: Theme.of(context).secondaryHeaderColor,
            ),
          ),
        ),
        GestureDetector(
          child: Icon(
            Icons.close,
            color: Theme.of(context).secondaryHeaderColor,
          ),
          onTap: () {
            setState(() {
              isSearchTapped = !isSearchTapped;
            });
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
        final currentitem = _getCurrentItems()[index];

        if (selectedMenuIndex == 0) {
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
              noOfDest: country.noOfDest,
              customButton: index < _getCurrentItems().length - 1
                  ? _buildNextButton(screenWidth, context)
                  : null,
            ),
          );
        } else {
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
              noOfDest: city.noOfDest,
              customButton: index < _getCurrentItems().length - 1
                  ? _buildNextButton(screenWidth, context)
                  : null,
            ),
          );
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
