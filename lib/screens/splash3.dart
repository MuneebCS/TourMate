import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashThree extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              width: screenWidth,
              height: screenHeight,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage("assets/images/splash3.jpg"),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.5),
                    BlendMode.darken,
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: screenHeight * 0.25,
              left: screenWidth * 0.05,
              right: screenWidth * 0.05,
              child: Text(
                "Enjoy your travel experience",
                textAlign: TextAlign.left,
                style: GoogleFonts.roboto(
                  fontSize: 34,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
