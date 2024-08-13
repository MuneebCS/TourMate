import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import 'onboarding_screen.dart';

class SplashOne extends StatefulWidget {
  @override
  _SplashOneState createState() => _SplashOneState();
}

class _SplashOneState extends State<SplashOne>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    _navigateToMainScreen();
  }

  _navigateToMainScreen() async {
    await Future.delayed(const Duration(seconds: 5));
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => ONBoarding()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Lottie.asset('assets/images/animation.json'),
            Text(
              "Tour Mate",
              style: GoogleFonts.montserrat(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: Theme.of(context).hintColor),
            )
          ],
        ),
      ),
    );
  }
}
