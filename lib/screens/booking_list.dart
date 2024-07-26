import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:tourmate/widgets/custom_button.dart';
import 'package:tourmate/widgets/single_booking.dart';

class BookingList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
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
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: 25, right: 25, top: kToolbarHeight),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Booking List",
                    style: TextStyle(
                      color: Theme.of(context).secondaryHeaderColor,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.search,
                      color: Theme.of(context).secondaryHeaderColor,
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 25),
              child: Divider(thickness: 2, color: Theme.of(context).cardColor),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SingleBooking(
                      title: "Kuta Beach",
                      imageUrl: 'assets/images/B1.jpg',
                      rating: '4.2',
                      status: "Cancelled",
                      duration: "4 Jan - 20 Jan",
                      customButton: CustomButton(
                        Col: Colors.transparent,
                        C_height: 50,
                        C_width: 100,
                        onPress: () {},
                        child: Icon(
                          Icons.arrow_forward,
                          color: Theme.of(context).secondaryHeaderColor,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SingleBooking(
                      title: "Borobudur Temple",
                      imageUrl: 'assets/images/B2.jpg',
                      rating: '4.2',
                      duration: "4 jan - 20 jan",
                      customButton: CustomButton(
                        Col: Colors.transparent,
                        C_height: 50,
                        C_width: 100,
                        onPress: () {},
                        child: Icon(
                          Icons.arrow_forward,
                          color: Theme.of(context).secondaryHeaderColor,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SingleBooking(
                      title: "Goreme National Park",
                      imageUrl: 'assets/images/splash1.jpg',
                      status: "Finished",
                      rating: '4.2',
                      duration: "4 jan - 20 jan",
                      customButton: CustomButton(
                        Col: Colors.transparent,
                        C_height: 50,
                        C_width: 100,
                        onPress: () {},
                        child: Icon(
                          Icons.arrow_forward,
                          color: Theme.of(context).secondaryHeaderColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
