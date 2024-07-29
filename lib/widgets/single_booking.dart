import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tourmate/widgets/custom_container.dart';
import '../widgets/custom_button.dart';

class SingleBooking extends StatelessWidget {
  final String title;
  final String imageUrl;
  final String rating;
  final String duration;
  final String? status;
  final CustomButton? customButton;

  SingleBooking({
    required this.title,
    required this.imageUrl,
    required this.rating,
    required this.duration,
    this.status,
    this.customButton,
  });

  @override
  Widget build(BuildContext context) {
    var col1 = Theme.of(context).secondaryHeaderColor;
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;

    return Container(
      width: screenWidth * 0.85,
      height: screenHeight * 0.35,
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
              color: Colors.black.withOpacity(0.4),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomContainer(
                      height: 30,
                      width: 60,
                      borderRadius: 18,
                      child: Padding(
                        padding: const EdgeInsets.all(2),
                        child: Row(
                          children: [
                            Icon(
                              Icons.star_sharp,
                              size: 14,
                              color: col1,
                            ),
                            const SizedBox(width: 4),
                            Expanded(
                              child: Text(
                                rating,
                                style: GoogleFonts.montserrat(
                                  color: col1,
                                  fontSize: 12,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    if (status != null)
                      CustomContainer(
                        height: 30,
                        width: 80,
                        borderRadius: 18,
                        child: Center(
                          child: Text(
                            status!,
                            style: GoogleFonts.roboto(
                              fontSize: 12,
                              color: col1,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
                const Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: GoogleFonts.roboto(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      duration,
                      style: GoogleFonts.roboto(
                        fontSize: 14,
                        color: Colors.white70,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                if (customButton != null)
                  Align(
                    alignment: Alignment.bottomRight,
                    child: CustomContainer(
                      height: 50,
                      width: 100,
                      borderRadius: 18,
                      child: customButton!,
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
