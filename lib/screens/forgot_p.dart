import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tourmate/screens/verification_code.dart';
import '../widgets/custom_button.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  int selectedIndex = -1;
  final List<String> options = [
    "Phone Number",
    "Primary Email",
    "Secondary Email"
  ];
  final List<String> details = [
    "+123456789",
    "primary@example.com",
    "secondary@example.com"
  ];
  final List<IconData> icons = [Icons.phone, Icons.email, Icons.email];

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
              "Forgot Password",
              style: Theme.of(context).textTheme.displayLarge?.copyWith(
                    fontSize: 45,
                  ),
            ),
            const SizedBox(height: 20),
            Text(
              "Please select your contact detail and we will send a verification code to reset your password.",
              style: Theme.of(context).textTheme.displayMedium?.copyWith(
                    fontSize: 16,
                  ),
            ),
            const SizedBox(height: 30),
            Column(
              children: List.generate(options.length, (index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  child: Container(
                    width: screenWidth * 0.85,
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardColor, // Add cardColor here
                      border: Border.all(
                        color: selectedIndex == index
                            ? Theme.of(context).secondaryHeaderColor
                            : Colors.transparent,
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      children: [
                        const SizedBox(width: 10),
                        Icon(
                          icons[index],
                          color: Theme.of(context).secondaryHeaderColor,
                        ),
                        const SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              options[index],
                              style: Theme.of(context)
                                  .textTheme
                                  .displayLarge
                                  ?.copyWith(
                                    fontSize: 18,
                                  ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              details[index],
                              style: GoogleFonts.montserrat(
                                color: Theme.of(context).hintColor,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              }),
            ),
            SizedBox(height: screenHeight * 0.1),
            CustomButton(
              c_height: 50,
              c_width: screenWidth * 0.85,
              col: Theme.of(context).secondaryHeaderColor,
              onPress: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => VerificationCode(),
                    ));
              },
              child: Text(
                "Verify",
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
