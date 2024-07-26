import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:tourmate/screens/login.dart';
import '../widgets/custom_button.dart';
import 'splash2.dart';
import 'splash3.dart';
import 'splash4.dart';

class ONBoarding extends StatefulWidget {
  @override
  _ONBoardingState createState() => _ONBoardingState();
}

class _ONBoardingState extends State<ONBoarding> {
  final PageController _controller = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            children: [
              SplashTwo(),
              SplashThree(),
              SplashFour(),
            ],
          ),
          Positioned(
            bottom: screenHeight * 0.22,
            left: screenWidth * 0.05,
            child: Center(
              child: SmoothPageIndicator(
                controller: _controller,
                count: 3,
                effect: ExpandingDotsEffect(
                  activeDotColor: Theme.of(context).secondaryHeaderColor,
                  dotColor: Theme.of(context).primaryColor,
                  dotHeight: 3,
                  dotWidth: 10,
                  spacing: 5,
                ),
              ),
            ),
          ),
          if (_currentPage < 2)
            Positioned(
                bottom: screenHeight * 0.02,
                right: screenWidth * 0.05,
                child: CustomButton(
                  C_height: 60,
                  C_width: 60,
                  Col: Theme.of(context).secondaryHeaderColor,
                  onPress: () {
                    _controller.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  },
                  child: const Icon(Icons.arrow_forward),
                ))
          else if (_currentPage == 2)
            Positioned(
                bottom: screenHeight * 0.02,
                right: screenWidth * 0.05,
                child: CustomButton(
                  C_height: 60,
                  C_width: 90,
                  Col: Theme.of(context).secondaryHeaderColor,
                  onPress: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Login(),
                      ),
                    );
                  },
                  child: Text(
                    "Sign in",
                    style: GoogleFonts.roboto(
                        fontSize: 15, color: Theme.of(context).primaryColor),
                  ),
                )),
        ],
      ),
    );
  }
}
