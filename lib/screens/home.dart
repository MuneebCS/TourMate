import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:tourmate/widgets/custom_button.dart';
import 'package:tourmate/widgets/menu_bar.dart';
import '../providers/search_filter_provider.dart';
import '../widgets/city_view.dart';
import '../widgets/country_view.dart';
import '../widgets/destination_view.dart';
import 'booking_detail_page.dart';

class Home extends StatefulWidget {
  final Function onDrawer;
  const Home({super.key, required this.onDrawer});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final PageController _pageController = PageController(viewportFraction: 0.9);
  int selectedMenuIndex = 0;
  bool isSearchTapped = false;

  @override
  void initState() {
    super.initState();
    final searchProvider = Provider.of<SearchProvider>(context, listen: false);
    searchProvider.searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    final searchProvider = Provider.of<SearchProvider>(context, listen: false);
    searchProvider.searchController.removeListener(_onSearchChanged);
    super.dispose();
  }

  void _onSearchChanged() {
    setState(() {}); // Trigger a rebuild to update the UI
  }

  void _onMenuItemSelected(int index) {
    setState(() {
      selectedMenuIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    final searchProvider = Provider.of<SearchProvider>(context);
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
              padding: const EdgeInsets.only(left: 30, top: 10, right: 30),
              child: isSearchTapped
                  ? Padding(
                      padding: const EdgeInsets.only(top: 12),
                      child: _buildTextField(searchProvider),
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
                      child:
                          _buildPageView(screenWidth, context, searchProvider),
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
                widget.onDrawer();
              },
            );
          },
        ),
      ],
    );
  }

  Widget _buildProfileButton(BuildContext context) {
    return Container(
      width: 55,
      height: 55,
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(18),
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
          style: GoogleFonts.montserrat(fontSize: 10),
        ),
        const SizedBox(height: 2),
        Text(
          "Evelyn",
          style:
              GoogleFonts.montserrat(fontSize: 20, fontWeight: FontWeight.bold),
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

  Widget _buildTextField(SearchProvider searchProvider) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: SizedBox(
            height: 30,
            child: TextField(
              controller: searchProvider.searchController,
              onChanged: (value) {
                String filteredValue = value.trim();

                if (filteredValue != searchProvider.searchController.text) {
                  searchProvider.searchController.value =
                      searchProvider.searchController.value.copyWith(
                    text: filteredValue,
                  );
                }
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
            searchProvider.searchController.clear();
            setState(() {
              isSearchTapped = !isSearchTapped;
            });
          },
        ),
      ],
    );
  }

  Widget _buildPageView(
      double screenWidth, BuildContext context, SearchProvider searchProvider) {
    final filteredItems = searchProvider.getFilteredItems(selectedMenuIndex);
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
              customButton:
                  _buildNextDestButton(screenWidth, context, destination),
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
  }

  CustomButton _buildNextButton(double screenWidth, BuildContext context) {
    return CustomButton(
      c_height: 50,
      c_width: screenWidth * 0.3,
      col: Colors.transparent,
      onPress: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const BookingDetail(
                location: "Paris France",
                title: "Goreme National Park",
                imageUrl: 'assets/images/splash1.jpg',
                rating: '4.2',
              ),
            ));
      },
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

  CustomButton _buildNextDestButton(
      double screenWidth, BuildContext context, OneDestination destination) {
    return CustomButton(
      c_height: 50,
      c_width: screenWidth * 0.3,
      col: Colors.transparent,
      onPress: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => BookingDetail(
                location: destination.location,
                title: destination.title,
                imageUrl: destination.imageUrl,
                rating: destination.rating,
              ),
            ));
      },
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
