import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:tourmate/providers/bookmark_filter_provider.dart';
import 'package:tourmate/widgets/custom_button.dart';
import 'package:tourmate/widgets/destination_view.dart';

class Bookmarks extends StatefulWidget {
  const Bookmarks({super.key});

  @override
  State<Bookmarks> createState() => _BookmarksState();
}

class _BookmarksState extends State<Bookmarks> {
  bool isSearchTapped = false;
  final PageController _pageController = PageController(viewportFraction: 0.75);

  @override
  void initState() {
    super.initState();
    final searchProvider =
        Provider.of<BookmarkProvider>(context, listen: false);
    searchProvider.searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    final searchProvider =
        Provider.of<BookmarkProvider>(context, listen: false);
    searchProvider.searchController.removeListener(_onSearchChanged);
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final bookmarkProvider = Provider.of<BookmarkProvider>(context);
    bookmarkProvider.searchController.addListener(_onSearchChanged);
  }

  void _onSearchChanged() {
    setState(() {});
  }

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

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: Consumer<BookmarkProvider>(
          builder: (context, searchProvider, child) {
            final filteredItems = searchProvider.getFilteredBookmarks();

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 25),
                  child: isSearchTapped
                      ? _buildTextField(searchProvider)
                      : _buildBookMarkRow(context),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30, bottom: 10),
                  child: Divider(
                    thickness: 2,
                    color: Theme.of(context).cardColor,
                  ),
                ),
                Expanded(
                  child: filteredItems.isEmpty
                      ? Center(
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "It's empty in here",
                                  style: GoogleFonts.montserrat(
                                    color:
                                        const Color.fromRGBO(255, 255, 255, 1),
                                    fontSize: 40,
                                  ),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Text(
                                  'Try add some destination to your bookmark',
                                  style: GoogleFonts.montserrat(
                                    color: Colors.white60,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      : PageView.builder(
                          controller: _pageController,
                          itemCount: filteredItems.length,
                          itemBuilder: (BuildContext context, int index) {
                            final bookmark = filteredItems[index];
                            return Padding(
                              padding: EdgeInsets.only(
                                left: index == 0 ? 0 : 5,
                                right:
                                    index == filteredItems.length - 1 ? 0 : 5,
                              ),
                              child: OneDestination(
                                title: bookmark.title,
                                imageUrl: bookmark.imageUrl,
                                location: bookmark.location,
                                rating: bookmark.rating,
                                customButton: index < filteredItems.length - 1
                                    ? CustomButton(
                                        c_height: 50,
                                        c_width: screenWidth * 0.3,
                                        col: Colors.transparent,
                                        onPress: _scrollToNextPage,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(18),
                                          ),
                                          child: Stack(
                                            alignment: Alignment.center,
                                            children: [
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(18),
                                                child: BackdropFilter(
                                                  filter: ImageFilter.blur(
                                                      sigmaX: 10.0,
                                                      sigmaY: 10.0),
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
            );
          },
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

  Widget _buildTextField(BookmarkProvider searchProvider) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: SizedBox(
            height: 30,
            child: TextField(
              controller: searchProvider.searchController,
              onChanged: (value) {
                setState(() {
                  String filteredValue = value.trim();

                  if (filteredValue != searchProvider.searchController.text) {
                    searchProvider.searchController.value =
                        searchProvider.searchController.value.copyWith(
                      text: filteredValue,
                    );
                  }
                });
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
}
