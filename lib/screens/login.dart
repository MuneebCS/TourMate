import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tourmate/screens/forgot_p.dart';
import 'package:tourmate/screens/homescreen.dart';
import 'package:tourmate/screens/register.dart';
import 'package:tourmate/widgets/custom_button.dart';
import 'package:tourmate/widgets/custom_textfield.dart';

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
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

    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
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
                const SizedBox(height: 200),
                Padding(
                  padding: const EdgeInsets.only(right: 200),
                  child: Text(
                    "Login",
                    style: GoogleFonts.roboto(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 70),
                CustomTextField(
                  height: 40,
                  width: screenWidth * 0.85,
                  leadingIcon: Icons.email,
                  hintText: 'Email ID',
                ),
                const SizedBox(height: 20),
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
                const SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: EdgeInsets.only(left: screenWidth * 0.65),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ForgotPassword(),
                          ));
                    },
                    child: Text(
                      "Forgot?",
                      style: GoogleFonts.roboto(
                        color: Theme.of(context).secondaryHeaderColor,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                Center(
                  child: CustomButton(
                    C_height: 50,
                    C_width: screenWidth * 0.85,
                    Col: Theme.of(context).secondaryHeaderColor,
                    onPress: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HomeScreen(),
                          ));
                    },
                    child: Text(
                      "Login",
                      style: GoogleFonts.roboto(
                          fontSize: 16, color: Theme.of(context).primaryColor),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Center(
                  child: Text(
                    "Or Login With",
                    style: GoogleFonts.roboto(
                        fontSize: 13, color: Theme.of(context).hintColor),
                  ),
                ),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CustomButton(
                      C_height: 60,
                      C_width: 90,
                      Col: Theme.of(context).cardColor,
                      onPress: () {},
                      child: Icon(
                        Icons.apple,
                        size: 28,
                        color: Theme.of(context).hintColor,
                      ),
                    ),
                    CustomButton(
                      C_height: 60,
                      C_width: 90,
                      Col: Theme.of(context).cardColor,
                      onPress: () {},
                      child: SvgPicture.asset(
                        'assets/icons/googl1.svg',
                        width: 20,
                        height: 20,
                        color: Theme.of(context).hintColor,
                      ),
                    ),
                    CustomButton(
                      C_height: 60,
                      C_width: 90,
                      Col: Theme.of(context).cardColor,
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
                        "New User? ",
                        style: GoogleFonts.roboto(
                          fontSize: 12,
                          color: Colors.white,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Register(),
                              ));
                        },
                        child: Text(
                          "Register Here",
                          style: GoogleFonts.roboto(
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
