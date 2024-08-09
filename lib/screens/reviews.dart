import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/custom_container.dart';

class Reviews extends StatefulWidget {
  final String title;
  final String location;

  const Reviews({
    super.key,
    required this.title,
    required this.location,
  });

  @override
  _ReviewsState createState() => _ReviewsState();
}

class _ReviewsState extends State<Reviews> {
  List<Review> allReviews = [
    Review(
        "Ali",
        "02-june-2021",
        "assets/images/B1.jpg",
        "I am proficient in Dart, Firebase, and integrating REST APIs, among other technologies. Some of my key projects include [mention a couple of significant projects briefly]. My goal is to leverage my expertise to create innovative and efficient mobile solutions.",
        3.6),
    Review(
        "Hamza",
        "02-june-2021",
        "assets/images/B2.jpg",
        "I am proficient in Dart, Firebase, and integrating REST APIs, among other technologies. Some of my key projects include [mention a couple of significant projects briefly]. My goal is to leverage my expertise to create innovative and efficient mobile solutions.",
        5.0),
    Review(
        "Faizan",
        "02-june-2021",
        "assets/images/splash1.jpg",
        "I am proficient in Dart, Firebase, and integrating REST APIs, among other technologies. Some of my key projects include [mention a couple of significant projects briefly]. My goal is to leverage my expertise to create innovative and efficient mobile solutions.",
        4.0),
    Review(
        "Abdullah",
        "02-june-2021",
        "assets/images/splash2.jpg",
        "I am proficient in Dart, Firebase, and integrating REST APIs, among other technologies. Some of my key projects include [mention a couple of significant projects briefly]. My goal is to leverage my expertise to create innovative and efficient mobile solutions.",
        2.5),
    Review(
        "Fatima",
        "02-june-2021",
        "assets/images/splash3.jpg",
        "I am proficient in Dart, Firebase, and integrating REST APIs, among other technologies. Some of my key projects include [mention a couple of significant projects briefly]. My goal is to leverage my expertise to create innovative and efficient mobile solutions.",
        3.0),
    Review(
        "Ayesha",
        "02-june-2021",
        "assets/images/splash4.jpg",
        "I am proficient in Dart, Firebase, and integrating REST APIs, among other technologies. Some of my key projects include [mention a couple of significant projects briefly]. My goal is to leverage my expertise to create innovative and efficient mobile solutions.",
        5.0),
  ];

  List<Review> filteredReviews = [];

  String selectedFilter = "All";

  @override
  void initState() {
    super.initState();
    filteredReviews = allReviews;
  }

  void filterReviews(String filter) {
    setState(() {
      selectedFilter = filter;

      if (filter == "All") {
        filteredReviews = allReviews;
      } else {
        double rating = double.parse(filter);

        filteredReviews = allReviews.where((review) {
          if (filter.contains('.5')) {
            return review.rating == rating;
          } else {
            return review.rating.roundToDouble() == rating;
          }
        }).toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: screenHeight * 0.09),
            SizedBox(
              width: screenWidth * 0.8,
              child: Text(
                widget.title,
                style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.bold,
                  fontSize: 32,
                  color: Colors.white,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 4,
              ),
            ),
            SizedBox(height: screenHeight * 0.01),
            SizedBox(
              width: screenWidth * 0.8,
              child: Text(
                widget.location,
                style: GoogleFonts.montserrat(
                  fontSize: 15,
                  color: Colors.white30,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
            ),
            SizedBox(height: screenHeight * 0.05),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Row(
                  children: [
                    _filterButton("All"),
                    const SizedBox(width: 10),
                    _filterButton("5"),
                    const SizedBox(width: 10),
                    _filterButton("4"),
                    const SizedBox(width: 10),
                    _filterButton("3"),
                    const SizedBox(width: 10),
                    _filterButton("2"),
                  ],
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.05),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: filteredReviews.map((review) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5.0),
                      child: _oneReview(review),
                    );
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _filterButton(String label) {
    return GestureDetector(
      onTap: () => filterReviews(label),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            border: Border.all(
              color: selectedFilter == label
                  ? const Color(0xFFE1A25A)
                  : Colors.transparent,
            )),
        child: CustomContainer(
          height: 35,
          width: 55,
          borderRadius: 18,
          child: Padding(
            padding: const EdgeInsets.all(2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.star_sharp,
                  size: 14,
                  color: selectedFilter == label
                      ? const Color(0xFFE1A25A)
                      : Colors.grey,
                ),
                const SizedBox(width: 4),
                Text(
                  label,
                  style: GoogleFonts.montserrat(
                    color: selectedFilter == label
                        ? const Color(0xFFE1A25A)
                        : Colors.grey,
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _oneReview(Review review) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(review.image),
              radius: 20,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    review.name,
                    style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    review.postedDate,
                    style: GoogleFonts.montserrat(
                      fontSize: 12,
                      color: Theme.of(context).hintColor,
                    ),
                  ),
                ],
              ),
            ),
            _showRating(review.rating.toStringAsFixed(1)),
          ],
        ),
        const SizedBox(height: 8),
        Text(
          review.review,
          style: GoogleFonts.montserrat(
            fontSize: 14,
            color: Theme.of(context).hintColor,
          ),
        ),
      ],
    );
  }

  Widget _showRating(String rating) {
    return CustomContainer(
      height: 35,
      width: 55,
      borderRadius: 18,
      child: Padding(
        padding: const EdgeInsets.all(2),
        child: Row(
          children: [
            const Icon(
              Icons.star_sharp,
              size: 14,
              color: Color(0xFFE1A25A),
            ),
            const SizedBox(width: 4),
            Expanded(
              child: Text(
                rating,
                style: GoogleFonts.montserrat(
                  color: const Color(0xFFE1A25A),
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Review {
  final String name;
  final String postedDate;
  final String image;
  final String review;
  final double rating;

  Review(this.name, this.postedDate, this.image, this.review, this.rating);
}
