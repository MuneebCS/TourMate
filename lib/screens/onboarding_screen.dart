import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:tourmate/screens/login.dart';
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
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(left: 20, bottom: 60),
                child: SmoothPageIndicator(
                  controller: _controller,
                  count: 3,
                  effect: ExpandingDotsEffect(
                    activeDotColor: Theme.of(context).secondaryHeaderColor,
                    dotColor:
                        Theme.of(context).secondaryHeaderColor.withOpacity(0.5),
                    dotHeight: 3,
                    dotWidth: 10,
                    spacing: 5,
                  ),
                ),
              ),
              Row(
                children: [
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(right: 20, bottom: 20),
                    child: ElevatedButton(
                      style: ButtonStyle(
                          shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24.0),
                          )),
                          backgroundColor: WidgetStatePropertyAll(
                              Theme.of(context).secondaryHeaderColor),
                          padding: const WidgetStatePropertyAll(
                              EdgeInsets.symmetric(
                                  horizontal: 40, vertical: 20))),
                      onPressed: buttonContent,
                      child: _currentPage < 2
                          ? Icon(Icons.arrow_forward,
                              color: Theme.of(context).primaryColor)
                          : Text(
                              "Sign in",
                              style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                  color: Theme.of(context).primaryColor),
                            ),
                    ),
                  )
                ],
              )
            ],
          ),
        ],
      ),
    );
  }

  void buttonContent() {
    if (_currentPage < 2) {
      _controller.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else if (_currentPage == 2) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const Login(),
        ),
      );
    }
  }
}
