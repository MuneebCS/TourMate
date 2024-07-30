import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tourmate/widgets/custom_button.dart';
import 'package:tourmate/widgets/one_bookmark.dart'; // Ensure you have this package in your pubspec.yaml

// ignore: must_be_immutable
class Bookmarks extends StatefulWidget {
  Bookmarks({super.key});

  @override
  State<Bookmarks> createState() => _BookmarksState();
}

class _BookmarksState extends State<Bookmarks> {
  bool isSearchTapped = false;

  List<OneBookmark> bookmarks = [
    OneBookmark(
      title: 'Goreme National Park',
      imageUrl: 'assets/images/splash5.jpg',
      location: 'Nevsehir Markiz Turkey',
      rating: '4.5',
      isOneBookmark: const Icon(Icons.bookmark),
    ),
    OneBookmark(
      title: 'Goreme National Park',
      imageUrl: 'assets/images/splash4.jpg',
      location: 'Nevsehir Markiz Turkey',
      rating: '4.5',
      isOneBookmark: const Icon(Icons.bookmark),
    ),
    OneBookmark(
      title: 'Goreme National Park',
      imageUrl: 'assets/images/splash3.jpg',
      location: 'Nevsehir Markiz Turkey',
      rating: '4.5',
      isOneBookmark: const Icon(Icons.bookmark),
    ),
  ];

  final PageController _pageController = PageController(viewportFraction: 0.75);

  void _scrollToNextPage() {
    if (_pageController.hasClients) {
      final int nextPage = _pageController.page!.toInt() + 1;
      if (nextPage < bookmarks.length) {
        _pageController.animateToPage(
          nextPage,
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeInOut,
        );
      }
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
              padding: const EdgeInsets.only(top: 25, left: 30, right: 30),
              child: isSearchTapped
                  ? _buildTextField(context)
                  : _buildBookMarkRow(context),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, bottom: 10),
              child: Divider(thickness: 2, color: Theme.of(context).cardColor),
            ),
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: bookmarks.length,
                itemBuilder: (BuildContext context, int index) {
                  final bookmark = bookmarks[index];
                  return Padding(
                    padding: EdgeInsets.only(
                      left: index == 0 ? 0 : 5,
                      right: index == bookmarks.length - 1 ? 0 : 5,
                    ),
                    child: OneBookmark(
                      title: bookmark.title,
                      imageUrl: bookmark.imageUrl,
                      location: bookmark.location,
                      rating: bookmark.rating,
                      isOneBookmark: bookmark.isOneBookmark,
                      customButton: index < bookmarks.length - 1
                          ? CustomButton(
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
                                        filter: ImageFilter.blur(
                                            sigmaX: 10.0, sigmaY: 10.0),
                                        child: Container(
                                          color: Theme.of(context)
                                              .secondaryHeaderColor
                                              .withOpacity(0.2),
                                        ),
                                      ),
                                    ),
                                    Icon(
                                      Icons.arrow_forward,
                                      color: Theme.of(context)
                                          .secondaryHeaderColor,
                                    ),
                                  ],
                                ),
                              ),
                            )
                          : null,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBookMarkRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Your Bookmark",
          style: GoogleFonts.montserrat(
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
          child: Container(
            height: 27,
            child: TextField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(13),
                hintText: 'Search your bookmarks',
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
}
