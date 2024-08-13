import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            "assets/images/splash1.jpg",
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
            color: Colors.black.withOpacity(0.6),
            colorBlendMode: BlendMode.darken,
          ),

          Column(
            children: [
              const Spacer(),
              SafeArea(
                child: Padding(
                  padding:
                      const EdgeInsets.only(left: 20, right: 20, bottom: 160),
                  child: Text(
                    "Let's Explore the beauty of the world!",
                    textAlign: TextAlign.left,
                    style: GoogleFonts.montserrat(
                      fontSize: 34,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
          // Positioned(
          //   bottom: screenHeight * 0.25,
          //   left: screenWidth * 0.05,
          //   right: screenWidth * 0.05,
          //   child:
          // ),
        ],
      ),
    );
  }
}
