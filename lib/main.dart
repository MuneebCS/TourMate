import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:tourmate/providers/bookmark_filter_provider.dart';
import 'package:tourmate/providers/reviews_provider.dart';
import 'package:tourmate/screens/onboarding_screen.dart';
import 'package:tourmate/theme/dark_theme.dart';
import 'providers/search_filter_provider.dart';
import 'screens/splash1.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  BindingBase.debugZoneErrorsAreFatal = true;
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) {
    runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => SearchProvider()),
          ChangeNotifierProvider(create: (_) => BookmarkProvider()),
          ChangeNotifierProvider(create: (_) => ReviewsProvider()),
        ],
        child: const MyApp(),
      ),
    );
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Tour Mate",
        theme: darkTheme,
        // theme: lightTheme,
        darkTheme: darkTheme,
        home: ONBoarding());
  }
}
