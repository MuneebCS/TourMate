import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tourmate/screens/reset_p.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_textfield.dart';

class VerificationCode extends StatefulWidget {
  @override
  State<VerificationCode> createState() => _VerificationCodeState();
}

class _VerificationCodeState extends State<VerificationCode> {
  bool _obscureText = true;

  void _toggleVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

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
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "Verification ",
                    style: Theme.of(context).textTheme.displayLarge?.copyWith(
                          fontSize: 50,
                        ),
                  ),
                  TextSpan(
                    text: "Code",
                    style: Theme.of(context).textTheme.displayLarge?.copyWith(
                          fontSize: 50,
                        ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Text(
              "Please select your contact details and we will send a verification code to reset your password.",
              style: Theme.of(context).textTheme.displayMedium?.copyWith(
                    fontSize: 16,
                  ),
            ),
            SizedBox(height: screenHeight * 0.13),
            Row(
              children: [
                CustomTextField(
                  height: 40,
                  width: screenWidth * 0.19,
                ),
                const SizedBox(
                  width: 10,
                ),
                CustomTextField(
                  height: 40,
                  width: screenWidth * 0.19,
                ),
                const SizedBox(
                  width: 10,
                ),
                CustomTextField(
                  height: 40,
                  width: screenWidth * 0.19,
                ),
                const SizedBox(width: 10),
                CustomTextField(
                  height: 40,
                  width: screenWidth * 0.19,
                ),
              ],
            ),
            SizedBox(height: screenHeight * 0.13),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Didn't recieve the code? ",
                  style: GoogleFonts.roboto(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Text(
                    "Resend Code",
                    style: GoogleFonts.roboto(
                      fontSize: 12,
                      color: Theme.of(context).secondaryHeaderColor,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: screenHeight * 0.13),
            CustomButton(
              C_height: 50,
              C_width: screenWidth * 0.85,
              Col: Theme.of(context).secondaryHeaderColor,
              onPress: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ResetPassword(),
                    ));
              },
              child: Text(
                "Verification",
                style:
                    GoogleFonts.roboto(color: Theme.of(context).primaryColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
