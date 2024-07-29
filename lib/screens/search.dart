import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tourmate/widgets/custom_container.dart';
import 'package:tourmate/widgets/map_view.dart';

class Search extends StatefulWidget {
  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Stack(
        children: [
          MyMap(),
          Padding(
            padding: const EdgeInsets.only(top: 30, left: 10, right: 10),
            child: CustomContainer(
              height: 50,
              width: screenWidth * 0.95,
              borderRadius: 18,
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 11),
                        child: TextField(
                          style: GoogleFonts.roboto(
                            color: Theme.of(context).primaryColor,
                          ),
                          cursorColor: Theme.of(context).hintColor,
                          decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent),
                            ),
                            hintText: 'Search your dream destination',
                            hintStyle: GoogleFonts.roboto(
                              color: Theme.of(context).cardColor,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                      icon: ImageIcon(
                        AssetImage('assets/icons/search.png'),
                        color: Theme.of(context).cardColor,
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
