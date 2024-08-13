import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart'; // Import provider package
import '../widgets/review_widget.dart';
import '../widgets/custom_container.dart';
import '../providers/reviews_provider.dart'; // Ensure this is the correct path

class Reviews extends StatelessWidget {
  final String title;
  final String location;

  const Reviews({
    super.key,
    required this.title,
    required this.location,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<ReviewsProvider>(builder: (context, provider, child) {
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
              SizedBox(height: MediaQuery.of(context).size.height * 0.09),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                child: Text(
                  title,
                  style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                    color: Colors.white,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 4,
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.01),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                child: Text(
                  location,
                  style: GoogleFonts.montserrat(
                    fontSize: 15,
                    color: Colors.white30,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.05),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Row(
                    children: [
                      _filterButton(context, provider, "All"),
                      const SizedBox(width: 10),
                      _filterButton(context, provider, "5"),
                      const SizedBox(width: 10),
                      _filterButton(context, provider, "4"),
                      const SizedBox(width: 10),
                      _filterButton(context, provider, "3"),
                      const SizedBox(width: 10),
                      _filterButton(context, provider, "2"),
                    ],
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.05),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: provider.filteredReviews.isNotEmpty
                        ? provider.filteredReviews.map((review) {
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 5.0),
                              child: ReviewWidget(review: review),
                            );
                          }).toList()
                        : [
                            Center(
                              child: Text(
                                'No reviews available',
                                style: GoogleFonts.montserrat(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }

  Widget _filterButton(
      BuildContext context, ReviewsProvider provider, String label) {
    return GestureDetector(
      onTap: () => provider.filterReviews(label),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            border: Border.all(
              color: provider.selectedFilter == label
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
                  color: provider.selectedFilter == label
                      ? const Color(0xFFE1A25A)
                      : Colors.grey,
                ),
                const SizedBox(width: 4),
                Text(
                  label,
                  style: GoogleFonts.montserrat(
                    color: provider.selectedFilter == label
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
}
