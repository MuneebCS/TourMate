import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tourmate/screens/registration_complete.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_textfield.dart';

class AccountSetup extends StatefulWidget {
  const AccountSetup({super.key});

  @override
  State<AccountSetup> createState() => _AccountSetupState();
}

class _AccountSetupState extends State<AccountSetup> {
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
                    text: "Account ",
                    style: Theme.of(context).textTheme.displayLarge?.copyWith(
                          fontSize: 45,
                        ),
                  ),
                  TextSpan(
                    text: "Setup",
                    style: Theme.of(context).textTheme.displayLarge?.copyWith(
                          fontSize: 45,
                        ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Text(
              "Finish your account setup by uploading profile picture and set your username.",
              style: Theme.of(context).textTheme.displayMedium?.copyWith(
                    fontSize: 14,
                  ),
            ),
            const SizedBox(
              height: 50,
            ),
            Center(
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          width: 3,
                          color: Theme.of(context).cardColor,
                        )),
                    child: CircleAvatar(
                      backgroundColor: Colors.transparent,
                      radius: 80,
                      child: Icon(
                        Icons.person,
                        size: 100,
                        color: Theme.of(context).secondaryHeaderColor,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 1,
                    right: 1,
                    child: CustomButton(
                      c_height: 60,
                      c_width: 60,
                      col: Theme.of(context).cardColor,
                      onPress: () {},
                      child: Icon(
                        Icons.upload,
                        color: Theme.of(context).secondaryHeaderColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: screenHeight * 0.05),
            CustomTextField(
              height: 40,
              width: screenWidth * 0.85,
              leadingIcon: Icons.person,
              hintText: 'user123',
            ),
            SizedBox(height: screenHeight * 0.09),
            CustomButton(
              c_height: 50,
              c_width: screenWidth * 0.85,
              col: Theme.of(context).secondaryHeaderColor,
              onPress: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RegistrationComplete(),
                    ));
              },
              child: Text(
                "Create Account",
                style: GoogleFonts.roboto(
                    fontSize: 14, color: Theme.of(context).primaryColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
