import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:tourmate/screens/login.dart';
import '../widgets/custom_button.dart';
import 'splash2.dart';
import 'splash3.dart';
import 'splash4.dart';

class ONBoarding extends StatefulWidget {
  const ONBoarding({super.key});

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
                bottom: screenHeight * 0.04,
                right: screenWidth * 0.07,
                child: CustomButton(
                  c_height: screenHeight * 0.08,
                  c_width: screenWidth * 0.2,
                  col: Theme.of(context).secondaryHeaderColor,
                  onPress: () {
                    _controller.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  },
                  child: Icon(Icons.arrow_forward,
                      color: Theme.of(context).primaryColor),
                ))
          else if (_currentPage == 2)
            Positioned(
                bottom: screenHeight * 0.04,
                right: screenWidth * 0.07,
                child: CustomButton(
                  c_height: screenHeight * 0.1,
                  c_width: screenWidth * 0.3,
                  col: Theme.of(context).secondaryHeaderColor,
                  onPress: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Login(),
                      ),
                    );
                  },
                  child: Text(
                    "Sign in",
                    style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        color: Theme.of(context).primaryColor),
                  ),
                )),
        ],
      ),
    );
  }
}
