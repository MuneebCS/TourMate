import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tourmate/screens/verify_identity.dart';
import 'package:tourmate/widgets/custom_button.dart';
import 'package:tourmate/widgets/custom_textfield.dart';

class Register extends StatefulWidget {
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
                const SizedBox(height: 190),
                Padding(
                  padding: const EdgeInsets.only(right: 150),
                  child: Text(
                    "Register",
                    style: GoogleFonts.roboto(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                CustomTextField(
                  height: 40,
                  width: screenWidth * 0.85,
                  leadingIcon: Icons.person,
                  hintText: 'Full Name',
                ),
                const SizedBox(height: 20),
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
                const SizedBox(height: 35),
                Center(
                  child: CustomButton(
                    C_height: 50,
                    C_width: screenWidth * 0.85,
                    Col: Theme.of(context).secondaryHeaderColor,
                    onPress: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => VerifyIdentity(),
                          ));
                    },
                    child: Text(
                      "Register",
                      style: GoogleFonts.roboto(
                          fontSize: 16, color: Theme.of(context).primaryColor),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Center(
                  child: Text(
                    "Or Register With",
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
                        "Already have an account? ",
                        style: GoogleFonts.roboto(
                          fontSize: 12,
                          color: Colors.white,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          "Login Here",
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
