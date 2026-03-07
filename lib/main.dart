import 'package:flutter/material.dart';
import 'screens/listings_feed.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Campus Housing',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.redAccent, // This is the main color
          surface: Colors.white,
        ),
        scaffoldBackgroundColor: Colors.white,
      ),
      // CHANGE THIS LINE:
      home: const ListingsFeed(),
    );
  }
}
