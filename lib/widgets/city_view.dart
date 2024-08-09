import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/custom_button.dart';

class OneCity extends StatelessWidget {
  final String title;
  final String imageUrl;

  final String location;
  final double noOfDest;
  final CustomButton? customButton;

  OneCity({
    required this.title,
    required this.imageUrl,
    required this.location,
    required this.noOfDest,
    this.customButton,
  });

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;

    return Container(
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
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Spacer(),
                    const Icon(
                      Icons.location_on,
                      size: 13,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      location,
                      style: GoogleFonts.montserrat(
                          fontSize: 13,
                          color: Colors.white,
                          fontWeight: FontWeight.w500),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                    ),
                  ],
                ),
                SizedBox(height: screenHeight * 0.35),
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
                Row(
                  children: [
                    const Icon(
                      Icons.umbrella_sharp,
                      size: 13,
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Text(
                      noOfDest.toString() + '+ Destinations',
                      style: GoogleFonts.montserrat(
                        fontSize: 12,
                        color: Colors.white,
                      ),
                    ),
                    const Spacer(),
                  ],
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
  }
}
