import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tourmate/screens/homescreen.dart';
import '../widgets/custom_button.dart';

class RegistrationComplete extends StatefulWidget {
  const RegistrationComplete({super.key});

  @override
  State<RegistrationComplete> createState() => _RegistrationCompleteState();
}

class _RegistrationCompleteState extends State<RegistrationComplete> {
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Register Complete",
              style: Theme.of(context).textTheme.displayLarge?.copyWith(
                    fontSize: 40,
                  ),
              overflow: TextOverflow.ellipsis,
              maxLines: 4,
            ),
            SizedBox(height: screenHeight * 0.05),
            Text(
              "You have successfully created your account.",
              style: GoogleFonts.montserrat(
                color: Theme.of(context).hintColor,
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: screenHeight * 0.05),
            Center(
              child: Column(
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        height: screenHeight * 0.35,
                        width: screenWidth * 0.57,
                        decoration: BoxDecoration(
                          gradient: RadialGradient(colors: [
                            Theme.of(context).secondaryHeaderColor,
                            Theme.of(context).hintColor,
                            Theme.of(context).cardColor,
                            Theme.of(context).hintColor,
                            Theme.of(context).cardColor,
                            Theme.of(context).primaryColor.withOpacity(0.3),
                            Theme.of(context).primaryColor.withOpacity(0.5),
                            Theme.of(context).primaryColor.withOpacity(0.7),
                          ]),
                          shape: BoxShape.circle,
                        ),
                      ),
                      CircleAvatar(
                        backgroundColor: Theme.of(context).cardColor,
                        radius: 80,
                        child: Icon(
                          Icons.person,
                          size: 60,
                          color: Theme.of(context).secondaryHeaderColor,
                        ),
                      ),
                      const Positioned(
                          bottom: 0,
                          child: Text(
                            "Evelyn",
                            style: TextStyle(
                                fontSize: 38, fontWeight: FontWeight.bold),
                          ))
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: screenHeight * 0.1),
            CustomButton(
              c_height: 50,
              c_width: screenWidth * 0.85,
              col: Theme.of(context).secondaryHeaderColor,
              onPress: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomeScreen(),
                    ));
              },
              child: Text(
                "Explore Home",
                style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: Theme.of(context).primaryColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
