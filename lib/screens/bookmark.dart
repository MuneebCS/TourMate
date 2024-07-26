import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:tourmate/widgets/custom_button.dart';
import 'package:tourmate/widgets/one_bookmark.dart'; // Ensure you have this package in your pubspec.yaml

class Bookmarks extends StatelessWidget {
  Bookmarks({super.key});

  final List<Map<String, dynamic>> bookmarks = [
    {
      'title': 'Goreme National Park',
      'imageUrl': 'assets/images/B2.jpg',
      'location': 'Nevsehir Markiz Turkey',
      'rating': '4.5',
      'isOneBookmark': Icon(Icons.bookmark),
    },
    {
      'title': 'Borobudar Temple',
      'imageUrl': 'assets/images/B1.jpg',
      'location': 'Magelang Indonesia',
      'rating': '4.2',
      'isOneBookmark': Icon(Icons.bookmark),
    },
    {
      'title': 'Goreme National Park',
      'imageUrl': 'assets/images/B2.jpg',
      'location': 'Nevsehir Markiz Turkey',
      'rating': '4.5',
      'isOneBookmark': Icon(Icons.bookmark),
    },
    {
      'title': 'Goreme National Park',
      'imageUrl': 'assets/images/B2.jpg',
      'location': 'Nevsehir Markiz Turkey',
      'rating': '4.5',
      'isOneBookmark': Icon(Icons.bookmark),
    },
    {
      'title': 'Goreme National Park',
      'imageUrl': 'assets/images/B2.jpg',
      'location': 'Nevsehir Markiz Turkey',
      'rating': '4.5',
      'isOneBookmark': Icon(Icons.bookmark),
    },
  ];

  final PageController _pageController = PageController(viewportFraction: 0.75);

  void _scrollToNextPage() {
    if (_pageController.hasClients) {
      final int nextPage = _pageController.page!.toInt() + 1;
      if (nextPage < bookmarks.length) {
        _pageController.animateToPage(
          nextPage,
          duration: Duration(milliseconds: 250),
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
              padding: EdgeInsets.only(left: 30, top: 10, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Your Bookmark",
                    style: TextStyle(
                      color: Theme.of(context).secondaryHeaderColor,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.search,
                      color: Theme.of(context).secondaryHeaderColor,
                    ),
                    onPressed: () {
                      // Handle search button press
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 30, bottom: 15),
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
                        title: bookmark['title'],
                        imageUrl: bookmark['imageUrl'],
                        location: bookmark['location'],
                        rating: bookmark['rating'],
                        isOneBookmark: bookmark['isOneBookmark'],
                        customButton: index < bookmarks.length - 1
                            ? CustomButton(
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
                            : null),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
