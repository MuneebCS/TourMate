import 'package:flutter/material.dart';
import '../widgets/city_view.dart';
import '../widgets/country_view.dart';
import '../widgets/destination_view.dart';

class SearchProvider extends ChangeNotifier {
  List<OneCity> cities = [
    OneCity(
      title: 'Tokyo',
      imageUrl: 'assets/images/splash1.jpg',
      location: 'Minato, Tokyo, Japan',
      noOfDest: 2.0,
    ),
    OneCity(
      title: 'Kyoto',
      imageUrl: 'assets/images/splash2.jpg',
      location: 'Kyoto, Japan',
      noOfDest: 2.0,
    ),
    OneCity(
      title: 'Rome',
      imageUrl: 'assets/images/splash3.jpg',
      location: 'Rome, Italy',
      noOfDest: 2.0,
    ),
    OneCity(
      title: 'Venice',
      imageUrl: 'assets/images/splash3.jpg',
      location: 'Venice, Italy',
      noOfDest: 2.0,
    ),
    OneCity(
      title: 'New York City',
      imageUrl: 'assets/images/splash3.jpg',
      location: 'New York, USA',
      noOfDest: 2.0,
    ),
    OneCity(
      title: 'San Francisco',
      imageUrl: 'assets/images/splash3.jpg',
      location: 'San Francisco, USA',
      noOfDest: 2.0,
    ),
  ];

  List<OneDestination> destinations = [
    OneDestination(
      title: 'Tokyo Tower',
      imageUrl: 'assets/images/splash4.jpg',
      location: 'Minato, Tokyo, Japan',
      rating: '4.5',
    ),
    OneDestination(
      title: 'Shinjuku Gyoen National Garden',
      imageUrl: 'assets/images/splash5.jpg',
      location: 'Shinjuku, Tokyo, Japan',
      rating: '4.5',
    ),
    OneDestination(
      title: 'Fushimi Inari Shrine',
      imageUrl: 'assets/images/B1.jpg',
      location: 'Fushimi, Kyoto, Japan',
      rating: '4.5',
    ),
    OneDestination(
      title: 'Kinkaku-ji (Golden Pavilion)',
      imageUrl: 'assets/images/splash4.jpg',
      location: 'Kita, Kyoto, Japan',
      rating: '4.5',
    ),
    OneDestination(
      title: 'Colosseum',
      imageUrl: 'assets/images/splash5.jpg',
      location: 'Rome, Italy',
      rating: '4.5',
    ),
    OneDestination(
      title: 'Vatican City',
      imageUrl: 'assets/images/B1.jpg',
      location: 'Vatican City, Rome, Italy',
      rating: '4.5',
    ),
    OneDestination(
      title: 'Grand Canal',
      imageUrl: 'assets/images/splash4.jpg',
      location: 'Venice, Italy',
      rating: '4.5',
    ),
    OneDestination(
      title: 'Piazza San Marco (St. Mark\'s Square)',
      imageUrl: 'assets/images/splash5.jpg',
      location: 'Venice, Italy',
      rating: '4.5',
    ),
    OneDestination(
      title: 'Statue of Liberty',
      imageUrl: 'assets/images/B1.jpg',
      location: 'Liberty Island, New York, USA',
      rating: '4.5',
    ),
    OneDestination(
      title: 'Central Park',
      imageUrl: 'assets/images/splash4.jpg',
      location: 'Manhattan, New York, USA',
      rating: '4.5',
    ),
    OneDestination(
      title: 'Golden Gate Bridge',
      imageUrl: 'assets/images/splash5.jpg',
      location: 'San Francisco, USA',
      rating: '4.5',
    ),
    OneDestination(
      title: 'Alcatraz Island',
      imageUrl: 'assets/images/B1.jpg',
      location: 'San Francisco Bay, USA',
      rating: '4.5',
    ),
  ];

  List<OneCountry> countries = [
    OneCountry(
      title: 'Japan',
      imageUrl: 'assets/images/B1.jpg',
      location: 'East Asia',
      noOfDest: 4.0,
    ),
    OneCountry(
      title: 'Italy',
      imageUrl: 'assets/images/B2.jpg',
      location: 'Southern Europe',
      noOfDest: 4.0,
    ),
    OneCountry(
      title: 'United States of America',
      imageUrl: 'assets/images/splash5.jpg',
      location: 'North America',
      noOfDest: 4.0,
    ),
  ];

  final TextEditingController searchController = TextEditingController();

  List<dynamic> getFilteredItems(int selectedMenuIndex) {
    final searchQuery = searchController.text.trim().toLowerCase();

    List<dynamic> items;

    switch (selectedMenuIndex) {
      case 0:
        items = destinations;
        break;
      case 1:
        items = countries;
        break;
      case 2:
        items = cities;
        break;
      default:
        items = cities;
    }

    if (searchQuery.isEmpty) {
      return items;
    } else {
      return items.where((item) {
        final itemTitle = item.title.toLowerCase();

        return itemTitle.contains(searchQuery);
      }).toList();
    }
  }
}
