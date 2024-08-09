import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tourmate/screens/reviews.dart';
import 'package:tourmate/screens/gallery_grid.dart';

import '../widgets/custom_button.dart';
import '../widgets/custom_container.dart';
import '../widgets/full_image.dart';

class BookingDetail extends StatefulWidget {
  final String title;
  final String location;
  final String imageUrl;
  final String rating;

  const BookingDetail({
    super.key,
    required this.title,
    required this.location,
    required this.imageUrl,
    required this.rating,
  });

  @override
  _BookingDetailState createState() => _BookingDetailState();
}

class _BookingDetailState extends State<BookingDetail> {
  bool _isHistorySelected = true; // Initial state is History

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Theme.of(context).primaryColor,
            elevation: 0,
            expandedHeight: 200,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                children: [
                  Image.asset(
                    widget.imageUrl,
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Theme.of(context).primaryColor.withOpacity(0.5),
                          Theme.of(context).primaryColor.withOpacity(0.7),
                          Theme.of(context).primaryColor,
                          Theme.of(context).primaryColor,
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            pinned: true,
          ),
          SliverToBoxAdapter(
            child: Container(
              color: Theme.of(context).primaryColor,
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          flex: 3,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _buildRatingContainer(context),
                              const SizedBox(height: 10),
                              _buildTitleRow(context),
                              const SizedBox(height: 10),
                            ],
                          ),
                        ),
                        SizedBox(width: screenWidth * 0.05),
                        Expanded(
                          flex: 1,
                          child: _buildMoreImages(context),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    _buildTabBar(context),
                    const SizedBox(height: 10),
                    _buildHistorySection(context),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: _buildPriceAndButton(context, screenWidth),
    );
  }

  Widget _buildMoreImages(BuildContext context) {
    final List<String> images = [
      'assets/images/B1.jpg',
      'assets/images/B2.jpg',
      'assets/images/splash1.jpg',
      'assets/images/splash2.jpg',
      'assets/images/splash3.jpg',
      'assets/images/splash4.jpg',
    ];

    return Column(
      children: List.generate(4, (index) {
        if (index == 3 && images.length > 4) {
          int remainingCount = images.length - 3;
          return CustomButton(
            c_height: 50,
            c_width: 50,
            col: Theme.of(context).cardColor,
            onPress: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => GalleryGrid(
                    title: widget.title,
                    location: widget.location,
                    imageLinks: images,
                  ),
                ),
              );
            },
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(18),
                  child: Image.asset(
                    height: 50,
                    width: 50,
                    images[index],
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    color: Colors.black.withOpacity(0.5),
                  ),
                  child: Center(
                    child: Text(
                      '+$remainingCount',
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        }

        return Column(
          children: [
            CustomButton(
              c_height: 50,
              c_width: 50,
              col: Theme.of(context).cardColor,
              onPress: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FullImage(
                      imageURL: images[index],
                      title: widget.title,
                    ),
                  ),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(18),
                  child: Image.asset(
                    height: 50,
                    width: 50,
                    images[index],
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 5),
          ],
        );
      }),
    );
  }

  Widget _buildRatingContainer(BuildContext context) {
    return CustomContainer(
      height: 35,
      width: 60,
      borderRadius: 18,
      child: Padding(
        padding: const EdgeInsets.all(2),
        child: Row(
          children: [
            Icon(
              Icons.star_sharp,
              size: 15,
              color: Theme.of(context).secondaryHeaderColor,
            ),
            const SizedBox(width: 4),
            Expanded(
              child: Text(
                widget.rating,
                style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).secondaryHeaderColor,
                  fontSize: 13,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTitleRow(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: GoogleFonts.montserrat(
            fontWeight: FontWeight.bold,
            fontSize: 32,
            color: Colors.white,
          ),
          overflow: TextOverflow.ellipsis,
          maxLines: 4,
        ),
        const SizedBox(height: 5),
        Text(
          widget.location,
          style: GoogleFonts.montserrat(
            fontSize: 16,
            color: Colors.white54,
          ),
          overflow: TextOverflow.ellipsis,
          maxLines: 3,
        ),
      ],
    );
  }

  Widget _buildTabBar(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildTabItem(
          context,
          "History",
          _isHistorySelected,
          () {
            setState(() {
              _isHistorySelected = true;
            });
          },
        ),
        _buildTabItem(
          context,
          "Reviews",
          !_isHistorySelected,
          () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Reviews(
                  title: widget.title,
                  location: widget.location,
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _buildTabItem(
      BuildContext context, String label, bool isSelected, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Text(
            label,
            style: GoogleFonts.montserrat(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: isSelected
                  ? Theme.of(context).secondaryHeaderColor
                  : Colors.grey,
            ),
          ),
          const SizedBox(height: 5),
          Container(
            height: 2,
            width: 30,
            color: isSelected
                ? Theme.of(context).secondaryHeaderColor
                : Colors.transparent,
          ),
        ],
      ),
    );
  }

  Widget _buildHistorySection(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      child: Text(
        "Kuta Beach, located on the southwestern coast of Bali, Indonesia, has a rich history that spans centuries, transforming from a small fishing village into one of the world's most renowned tourist destinations. In the early 19th century, Kuta was a quiet settlement where the local Balinese people engaged in fishing and farming. The arrival of international traders, particularly from the Dutch colonial period, began to change the region's dynamics. By the 1960s and 1970s, Kuta Beach started gaining popularity among backpackers and surfers from around the globe, drawn by its expansive sandy shores, consistent waves, and vibrant sunsets. This influx of visitors marked the beginning of its transformation into a bustling tourist hub. Over the decades, Kuta developed rapidly with the ruction of hotels, restaurants, and nightlife venues, becoming a symbol of Bali's booming tourism industry. Despite facing challenges such as natural disasters and the Bali bombings in the early 2000s, Kuta Beach has remained resilient, continuing to attract millions of visitors annually who seek its unique blend of natural beauty, cultural richness, and lively atmosphere.",
        style: GoogleFonts.montserrat(
          fontSize: 13,
          color: Colors.grey,
        ),
      ),
    );
  }

  Widget _buildPriceAndButton(BuildContext context, double screenWidth) {
    return Container(
      color: Theme.of(context).primaryColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '\$180',
                  style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    color: Theme.of(context).secondaryHeaderColor,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                ),
                Text(
                  "/Day",
                  style: GoogleFonts.montserrat(
                    fontSize: 14,
                    color: Theme.of(context).secondaryHeaderColor,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                ),
              ],
            ),
            CustomButton(
              c_height: 50,
              c_width: screenWidth * 0.5,
              col: Theme.of(context).secondaryHeaderColor,
              onPress: () {},
              child: Text(
                "Book Now",
                style: GoogleFonts.roboto(
                  fontSize: 16,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
