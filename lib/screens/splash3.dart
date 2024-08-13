import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashThree extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            "assets/images/splash2.jpg",
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
                    "Enjoy your travel experience",
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
        ],
      ),
    );
  }
}
