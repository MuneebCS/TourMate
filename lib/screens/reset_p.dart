import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tourmate/screens/login.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_textfield.dart';

class ResetPassword extends StatefulWidget {
  ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
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
            Text(
              "Reset Password",
              style: Theme.of(context).textTheme.displayLarge?.copyWith(
                    fontSize: 40,
                  ),
              overflow: TextOverflow.ellipsis,
              maxLines: 3,
            ),
            const SizedBox(height: 20),
            Text(
                "At least 8 characters with uppercase, lowercase, and special characters",
                style: GoogleFonts.montserrat(
                    color: Theme.of(context).hintColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w400)),
            SizedBox(height: screenHeight * 0.1),
            CustomTextField(
              height: 40,
              width: screenWidth * 0.85,
              leadingIcon: Icons.lock,
              hintText: 'New Password',
              obscureText: _obscureText,
              trailingWidget: GestureDetector(
                onTap: _toggleVisibility,
                child: Icon(
                  _obscureText ? Icons.visibility : Icons.visibility_off,
                  color: Theme.of(context).hintColor,
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.1),
            CustomTextField(
              height: 40,
              width: screenWidth * 0.85,
              leadingIcon: Icons.lock,
              hintText: 'Confirm Password',
              obscureText: _obscureText,
              trailingWidget: GestureDetector(
                onTap: _toggleVisibility,
                child: Icon(
                  _obscureText ? Icons.visibility : Icons.visibility_off,
                  color: Theme.of(context).hintColor,
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.2),
            CustomButton(
              c_height: 50,
              c_width: screenWidth * 0.85,
              col: Theme.of(context).secondaryHeaderColor,
              onPress: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Login(),
                    ));
              },
              child: Text(
                "Update Password",
                style: GoogleFonts.montserrat(
                    color: Theme.of(context).primaryColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
