import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        // The back arrow that takes you back to the feed
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: TextField(
          autofocus: true, // This magic line opens the keyboard immediately
          decoration: const InputDecoration(
            hintText: "Where to?",
            border: InputBorder.none, // Removes the underline
            hintStyle: TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.normal,
            ),
          ),
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          onSubmitted: (value) {
            // This is where you'll handle the actual search logic later
            print("Searching for: $value");
          },
        ),
      ),
      body: const Column(
        children: [
          Divider(height: 1), // Thin line to separate header from results
          // You can add "Recent Searches" or "Suggestions" here later
        ],
      ),
    );
  }
}
