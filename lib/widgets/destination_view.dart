import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../providers/bookmark_filter_provider.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_container.dart';

class OneDestination extends StatelessWidget {
  final String title;
  final String imageUrl;
  final String rating;
  final String location;
  final CustomButton? customButton;

  OneDestination({
    required this.title,
    required this.imageUrl,
    required this.location,
    required this.rating,
    this.customButton,
  });

  @override
  Widget build(BuildContext context) {
    var color1 = Theme.of(context).secondaryHeaderColor;
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;

    return Consumer<BookmarkProvider>(
      builder: (context, bookmarkProvider, child) {
        bool isBookmarked = bookmarkProvider.isBookmark(this);

        return SizedBox(
          width: screenWidth * 0.81,
          height: screenHeight * 0.95,
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  imageUrl,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.black.withOpacity(0.65),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomContainer(
                          height: 35,
                          width: 60,
                          borderRadius: 18,
                          child: Padding(
                            padding: const EdgeInsets.all(2),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.star_sharp,
                                  size: 14,
                                  color: color1,
                                ),
                                const SizedBox(width: 4),
                                Expanded(
                                  child: Text(
                                    rating,
                                    style: GoogleFonts.montserrat(
                                      color: color1,
                                      fontSize: 11,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            bookmarkProvider.toggleBookmark(this);
                          },
                          child: Icon(
                            isBookmarked
                                ? Icons.bookmark
                                : Icons.bookmark_border,
                            color: color1,
                            size: 24,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: screenHeight * 0.1),
                    Text(
                      title,
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: Colors.white,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                    ),
                    SizedBox(height: screenHeight * 0.01),
                    Text(
                      location,
                      style: GoogleFonts.montserrat(
                        fontSize: 15,
                        color: Colors.white,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                    ),
                    const Spacer(),
                    Padding(
                      padding: EdgeInsets.only(left: screenWidth * 0.4),
                      child: Container(
                        child: customButton,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
