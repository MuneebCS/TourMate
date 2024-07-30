import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tourmate/widgets/custom_button.dart';
import 'package:tourmate/widgets/single_booking.dart';

class BookingList extends StatefulWidget {
  const BookingList({super.key});

  @override
  State<BookingList> createState() => _BookingListState();
}

class _BookingListState extends State<BookingList> {
  bool isSearchTapped = false;
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
              child: isSearchTapped
                  ? _buildTextField(context)
                  : _buildBookingRow(context),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25),
              child: Divider(thickness: 2, color: Theme.of(context).cardColor),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SingleBooking(
                      title: "Kuta Beach",
                      imageUrl: 'assets/images/B2.jpg',
                      rating: '4.2',
                      status: "Cancelled",
                      duration: "4 Jan - 20 Jan",
                      customButton: CustomButton(
                        col: Colors.transparent,
                        c_height: 50,
                        c_width: 100,
                        onPress: () {},
                        child: Icon(
                          Icons.arrow_forward,
                          color: Theme.of(context).secondaryHeaderColor,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SingleBooking(
                      title: "Borobudur Temple",
                      imageUrl: 'assets/images/B1.jpg',
                      rating: '4.2',
                      duration: "4 jan - 20 jan",
                      customButton: CustomButton(
                        col: Colors.transparent,
                        c_height: 50,
                        c_width: 100,
                        onPress: () {},
                        child: Icon(
                          Icons.arrow_forward,
                          color: Theme.of(context).secondaryHeaderColor,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SingleBooking(
                      title: "Goreme National Park",
                      imageUrl: 'assets/images/splash1.jpg',
                      status: "Finished",
                      rating: '4.2',
                      duration: "4 jan - 20 jan",
                      customButton: CustomButton(
                        col: Colors.transparent,
                        c_height: 50,
                        c_width: 100,
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

  Widget _buildBookingRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Booking List",
          style: GoogleFonts.montserrat(
            color: Theme.of(context).secondaryHeaderColor,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        GestureDetector(
          child: SvgPicture.asset(
            'assets/icons/search.svg',
            color: Theme.of(context).secondaryHeaderColor,
          ),
          onTap: () {
            setState(() {
              isSearchTapped = !isSearchTapped;
            });
          },
        ),
      ],
    );
  }

  Widget _buildTextField(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Container(
            height: 27,
            child: TextField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(13),
                hintText: 'Search your Booking list',
                hintStyle: GoogleFonts.montserrat(
                    color: Theme.of(context).secondaryHeaderColor,
                    fontSize: 15),
                border: InputBorder.none,
              ),
              style: GoogleFonts.montserrat(
                  color: Theme.of(context).secondaryHeaderColor),
              cursorColor: Theme.of(context).secondaryHeaderColor,
            ),
          ),
        ),
        GestureDetector(
          child: Icon(
            Icons.close,
            color: Theme.of(context).secondaryHeaderColor,
          ),
          onTap: () {
            setState(() {
              isSearchTapped = !isSearchTapped;
            });
          },
        ),
      ],
    );
  }
}
