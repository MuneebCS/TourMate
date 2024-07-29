import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tourmate/widgets/custom_container.dart';
import '../widgets/custom_button.dart';

class OneDestination extends StatelessWidget {
  final String title;
  final String imageUrl;
  final String rating;
  final String location;
  final CustomButton? customButton;
  final Icon isOneDestination;

  OneDestination({
    required this.title,
    required this.imageUrl,
    required this.location,
    required this.rating,
    this.customButton,
    required this.isOneDestination,
  });

  @override
  Widget build(BuildContext context) {
    var Col1 = Theme.of(context).secondaryHeaderColor;
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
              color: Colors.black.withOpacity(0.4),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(9),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomContainer(
                      height: 35,
                      width: 55,
                      borderRadius: 18,
                      child: Padding(
                        padding: const EdgeInsets.all(2),
                        child: Row(
                          children: [
                            Icon(
                              Icons.star_sharp,
                              size: 14,
                              color: Col1,
                            ),
                            const SizedBox(width: 4),
                            Expanded(
                              child: Text(
                                rating,
                                style: GoogleFonts.montserrat(
                                  color: Col1,
                                  fontSize: 11,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Icon(
                      isOneDestination.icon,
                      color: Col1,
                    ),
                  ],
                ),
                const SizedBox(height: 100),
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
                const SizedBox(height: 20),
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
  }
}
