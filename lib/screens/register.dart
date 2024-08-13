import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tourmate/screens/verify_identity.dart';
import 'package:tourmate/widgets/custom_button.dart';
import 'package:tourmate/widgets/custom_textfield.dart';

class Register extends StatefulWidget {
  Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
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
      extendBodyBehindAppBar: true,
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
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              "assets/images/splash1.jpg",
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Theme.of(context).primaryColor.withOpacity(0.3),
                    Theme.of(context).primaryColor.withOpacity(0.5),
                    Theme.of(context).primaryColor,
                    Theme.of(context).primaryColor,
                    Theme.of(context).primaryColor,
                    Theme.of(context).primaryColor,
                    Theme.of(context).primaryColor,
                    Theme.of(context).primaryColor,
                    Theme.of(context).primaryColor,
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                SizedBox(height: screenHeight * 0.31),
                Padding(
                  padding: EdgeInsets.only(right: screenWidth * 0.35),
                  child: Text(
                    "Register",
                    style: Theme.of(context).textTheme.displayLarge?.copyWith(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.06),
                CustomTextField(
                  height: 40,
                  width: screenWidth * 0.85,
                  leadingIcon: Icons.person,
                  hintText: 'Full Name',
                ),
                SizedBox(height: screenHeight * 0.015),
                CustomTextField(
                  height: 40,
                  width: screenWidth * 0.85,
                  leadingIcon: Icons.email,
                  hintText: 'Email ID',
                ),
                SizedBox(height: screenHeight * 0.015),
                CustomTextField(
                  height: 40,
                  width: screenWidth * 0.85,
                  leadingIcon: Icons.lock,
                  hintText: 'Password',
                  obscureText: _obscureText,
                  trailingWidget: GestureDetector(
                    onTap: _toggleVisibility,
                    child: Icon(
                      _obscureText ? Icons.visibility : Icons.visibility_off,
                      color: Theme.of(context).hintColor,
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.06),
                Center(
                  child: CustomButton(
                    c_height: 50,
                    c_width: screenWidth * 0.85,
                    col: Theme.of(context).secondaryHeaderColor,
                    onPress: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => VerifyIdentity(),
                          ));
                    },
                    child: Text(
                      "Register",
                      style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          color: Theme.of(context).primaryColor),
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),
                Center(
                  child: Text(
                    "Or Register With",
                    style: GoogleFonts.montserrat(
                        fontSize: 13, color: Theme.of(context).hintColor),
                  ),
                ),
                SizedBox(height: screenHeight * 0.01),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CustomButton(
                      c_height: 60,
                      c_width: 90,
                      col: Theme.of(context).cardColor,
                      onPress: () {},
                      child: Icon(
                        Icons.apple,
                        size: 28,
                        color: Theme.of(context).hintColor,
                      ),
                    ),
                    CustomButton(
                      c_height: 60,
                      c_width: 90,
                      col: Theme.of(context).cardColor,
                      onPress: () {},
                      child: SvgPicture.asset(
                        'assets/icons/googl1.svg',
                        width: 20,
                        height: 20,
                        color: Theme.of(context).hintColor,
                      ),
                    ),
                    CustomButton(
                      c_height: 60,
                      c_width: 90,
                      col: Theme.of(context).cardColor,
                      onPress: () {},
                      child: Icon(
                        Icons.facebook,
                        size: 28,
                        color: Theme.of(context).hintColor,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account? ",
                        style:
                            Theme.of(context).textTheme.displayLarge?.copyWith(
                                  fontSize: 12,
                                ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          "Login Here",
                          style: GoogleFonts.montserrat(
                            fontSize: 12,
                            color: Theme.of(context).secondaryHeaderColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
