import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/custom_container.dart';

class Review {
  final String name;
  final String postedDate;
  final String image;
  final String review;
  final double rating;

  Review(this.name, this.postedDate, this.image, this.review, this.rating);
}

class ReviewWidget extends StatelessWidget {
  final Review review;

  const ReviewWidget({
    super.key,
    required this.review,
  });

  @override
  Widget build(BuildContext context) {
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
            _showRating(context, review.rating.toStringAsFixed(1)),
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

  Widget _showRating(BuildContext context, String rating) {
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
