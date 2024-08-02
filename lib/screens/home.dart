import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:tourmate/screens/settings.dart';
import 'package:tourmate/widgets/custom_button.dart';
import 'package:tourmate/widgets/menu_bar.dart';
import '../providers/search_filter_provider.dart';
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
  final ValueNotifier<String> _searchQuery = ValueNotifier<String>('');

  int selectedMenuIndex = 0;
  bool isSearchTapped = false;

  void _scrollToNextPage() {
    if (_pageController.hasClients) {
      final int nextPage = _pageController.page!.toInt() + 1;
      _pageController.animateToPage(
        nextPage,
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeInOut,
      );
    }
  }

  void _onMenuItemSelected(int index) {
    setState(() {
      selectedMenuIndex = index;
    });
  }

  List<dynamic> _getFilteredItems() {
    final searchQuery = _searchQuery.value.toLowerCase();
    final searchProvider = Provider.of<SearchProvider>(context, listen: false);

    List<dynamic> items;

    switch (selectedMenuIndex) {
      case 0:
        items = searchProvider.destinations;
        break;
      case 1:
        items = searchProvider.countries;
        break;
      case 2:
        items = searchProvider.cities;
        break;
      default:
        items = searchProvider.cities;
    }

    if (searchQuery.isEmpty) {
      return items;
    } else {
      return items.where((item) {
        final itemTitle = item.title.toLowerCase();
        return itemTitle.contains(searchQuery);
      }).toList();
    }
  }

  final TextEditingController searchController = TextEditingController();

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
                      child: _buildTextField(searchController),
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

  Widget _buildTextField(TextEditingController controller) {
    return ValueListenableBuilder<String>(
      valueListenable: _searchQuery,
      builder: (context, query, child) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: SizedBox(
                height: 30,
                child: TextField(
                  controller: controller,
                  onChanged: (value) {
                    _searchQuery.value = value.trim();
                    controller.text = controller.text.trim();
                  },
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
                _searchQuery.value = '';
                setState(() {
                  isSearchTapped = !isSearchTapped;
                });
              },
            ),
          ],
        );
      },
    );
  }

  Widget _buildPageView(double screenWidth, BuildContext context) {
    return ValueListenableBuilder<String>(
      valueListenable: _searchQuery,
      builder: (context, query, child) {
        final filteredItems = _getFilteredItems();
        return PageView.builder(
          controller: _pageController,
          itemCount: filteredItems.length,
          itemBuilder: (BuildContext context, int index) {
            final currentitem = filteredItems[index];

            if (selectedMenuIndex == 0) {
              final destination = currentitem as OneDestination;
              return Padding(
                padding: EdgeInsets.only(
                  left: index == 0 ? 0 : 5,
                  right: index == filteredItems.length - 1 ? 0 : 5,
                ),
                child: OneDestination(
                  title: destination.title,
                  imageUrl: destination.imageUrl,
                  location: destination.location,
                  rating: destination.rating,
                  customButton: index < filteredItems.length - 1
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
                  right: index == filteredItems.length - 1 ? 0 : 5,
                ),
                child: OneCountry(
                  title: country.title,
                  imageUrl: country.imageUrl,
                  location: country.location,
                  noOfDest: country.noOfDest,
                  customButton: index < filteredItems.length - 1
                      ? _buildNextButton(screenWidth, context)
                      : null,
                ),
              );
            } else {
              final city = currentitem as OneCity;
              return Padding(
                padding: EdgeInsets.only(
                  left: index == 0 ? 0 : 5,
                  right: index == filteredItems.length - 1 ? 0 : 5,
                ),
                child: OneCity(
                  title: city.title,
                  noOfDest: city.noOfDest,
                  imageUrl: city.imageUrl,
                  location: city.location,
                  customButton: index < filteredItems.length - 1
                      ? _buildNextButton(screenWidth, context)
                      : null,
                ),
              );
            }
          },
        );
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
