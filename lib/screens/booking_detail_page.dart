import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/custom_button.dart';
import '../widgets/custom_container.dart';

class BookingDetail extends StatelessWidget {
  final String title;
  final String location;
  final String imageUrl;
  final String rating;

  BookingDetail({
    required this.title,
    required this.location,
    required this.imageUrl,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Theme.of(context).primaryColor.withOpacity(0.3),
                  Theme.of(context).primaryColor.withOpacity(0.5),
                  Theme.of(context).primaryColor,
                  Theme.of(context).primaryColor,
                  Theme.of(context).primaryColor,
                  Theme.of(context).primaryColor,
                ],
              ),
            ),
          ),
          Positioned(
            top: screenHeight * 0.25,
            left: screenWidth * 0.05,
            right: screenWidth * 0.05,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildRatingContainer(context),
                  SizedBox(height: 10),
                  _buildTitleRow(context),
                  SizedBox(height: 10),
                  _buildHistorySection(context, screenHeight),
                  SizedBox(height: 10),
                  _buildPriceAndButton(context, screenWidth),
                  SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRatingContainer(BuildContext context) {
    return CustomContainer(
      height: 45,
      width: 65,
      borderRadius: 18,
      child: Padding(
        padding: EdgeInsets.all(5),
        child: Row(
          children: [
            Icon(
              Icons.star_sharp,
              size: 15,
              color: Theme.of(context).secondaryHeaderColor,
            ),
            SizedBox(width: 4),
            Expanded(
              child: Text(
                rating,
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
          title,
          style: GoogleFonts.montserrat(
            fontWeight: FontWeight.bold,
            fontSize: 32,
            color: Colors.white,
          ),
          overflow: TextOverflow.ellipsis,
          maxLines: 3,
        ),
        SizedBox(height: 5),
        Text(
          location,
          style: GoogleFonts.montserrat(
            fontSize: 16,
            color: Colors.white70,
          ),
          overflow: TextOverflow.ellipsis,
          maxLines: 3,
        ),
      ],
    );
  }

  Widget _buildHistorySection(BuildContext context, double screenHeight) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "History",
          style: GoogleFonts.montserrat(
            fontWeight: FontWeight.bold,
            fontSize: 15,
            color: Theme.of(context).hintColor,
          ),
        ),
        // Container(
        //   height: 2,
        //   width: 13,
        //   color: Theme.of(context).secondaryHeaderColor,
        // ),
        SizedBox(height: 5),
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.transparent,
                Colors.black.withOpacity(0.45),
              ],
            ),
          ),
          height: screenHeight * 0.42,
          child: SingleChildScrollView(
            child: Text(
              "Kuta Beach, located on the southwestern coast of Bali, Indonesia, has a rich history that spans centuries, transforming from a small fishing village into one of the world's most renowned tourist destinations. In the early 19th century, Kuta was a quiet settlement where the local Balinese people engaged in fishing and farming. The arrival of international traders, particularly from the Dutch colonial period, began to change the region's dynamics. By the 1960s and 1970s, Kuta Beach started gaining popularity among backpackers and surfers from around the globe, drawn by its expansive sandy shores, consistent waves, and vibrant sunsets. This influx of visitors marked the beginning of its transformation into a bustling tourist hub. Over the decades, Kuta developed rapidly with the construction of hotels, restaurants, and nightlife venues, becoming a symbol of Bali's booming tourism industry. Despite facing challenges such as natural disasters and the Bali bombings in the early 2000s, Kuta Beach has remained resilient, continuing to attract millions of visitors annually who seek its unique blend of natural beauty, cultural richness, and lively atmosphere.",
              style: GoogleFonts.montserrat(
                fontSize: 14,
                color: Colors.white70,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPriceAndButton(BuildContext context, double screenWidth) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              '\$120',
              style: GoogleFonts.montserrat(
                fontWeight: FontWeight.bold,
                fontSize: 24,
                color: Colors.white,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 3,
            ),
            Text(
              "/Day",
              style: GoogleFonts.montserrat(
                fontSize: 14,
                color: Colors.white,
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
    );
  }
}
