import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/listing_provider.dart';
import 'providers/auth_provider.dart';
import 'screens/listings_feed.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ListingProvider()..loadSampleData(),
        ),
        ChangeNotifierProvider(create: (_) => AuthProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Campus Housing',
        theme: ThemeData(
          // Airbnb uses a white background and high-contrast text
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.redAccent, // Closer to Airbnb's brand
            surface: Colors.white,
          ),
          scaffoldBackgroundColor: Colors.white,
        ),
        // CHANGE THIS LINE:
        home: const ListingsFeed(),
      ),
    );
  }
}
