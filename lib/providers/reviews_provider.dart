import 'package:flutter/material.dart';

import '../widgets/review_widget.dart';

class ReviewsProvider extends ChangeNotifier {
  List<Review> allReviews = [
    Review(
        "Ali",
        "02-june-2021",
        "assets/images/B1.jpg",
        "I am proficient in Dart, Firebase, and integrating REST APIs, among other technologies. Some of my key projects include [mention a couple of significant projects briefly]. My goal is to leverage my expertise to create innovative and efficient mobile solutions.",
        3.6),
    Review(
        "Hamza",
        "02-june-2021",
        "assets/images/B2.jpg",
        "I am proficient in Dart, Firebase, and integrating REST APIs, among other technologies. Some of my key projects include [mention a couple of significant projects briefly]. My goal is to leverage my expertise to create innovative and efficient mobile solutions.",
        5.0),
    Review(
        "Faizan",
        "02-june-2021",
        "assets/images/splash1.jpg",
        "I am proficient in Dart, Firebase, and integrating REST APIs, among other technologies. Some of my key projects include [mention a couple of significant projects briefly]. My goal is to leverage my expertise to create innovative and efficient mobile solutions.",
        4.0),
    Review(
        "Abdullah",
        "02-june-2021",
        "assets/images/splash2.jpg",
        "I am proficient in Dart, Firebase, and integrating REST APIs, among other technologies. Some of my key projects include [mention a couple of significant projects briefly]. My goal is to leverage my expertise to create innovative and efficient mobile solutions.",
        2.5),
    Review(
        "Fatima",
        "02-june-2021",
        "assets/images/splash3.jpg",
        "I am proficient in Dart, Firebase, and integrating REST APIs, among other technologies. Some of my key projects include [mention a couple of significant projects briefly]. My goal is to leverage my expertise to create innovative and efficient mobile solutions.",
        3.0),
    Review(
        "Ayesha",
        "02-june-2021",
        "assets/images/splash4.jpg",
        "I am proficient in Dart, Firebase, and integrating REST APIs, among other technologies. Some of my key projects include [mention a couple of significant projects briefly]. My goal is to leverage my expertise to create innovative and efficient mobile solutions.",
        5.0),
  ];

  List<Review> filteredReviews = [];
  String selectedFilter = "All";

  ReviewsProvider() {
    filteredReviews = allReviews;
  }

  void filterReviews(String filter) {
    selectedFilter = filter;

    if (filter == "All") {
      filteredReviews = allReviews;
    } else {
      double rating = double.parse(filter);

      filteredReviews = allReviews.where((review) {
        if (filter.contains('.5')) {
          return review.rating == rating;
        } else {
          return review.rating.roundToDouble() == rating;
        }
      }).toList();
    }
    notifyListeners(); // Notify listeners to rebuild widgets
  }
}
