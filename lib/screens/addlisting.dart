import 'package:flutter/material.dart';

class AddListingPage extends StatefulWidget {
  const AddListingPage({super.key});

  @override
  State<AddListingPage> createState() => _AddListingPageState();
}

class _AddListingPageState extends State<AddListingPage> {
  String _selectedCategory = 'House';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        title: const Text(
          "List your space",
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Property Details",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            // Photo Placeholder Box
            Container(
              height: 180,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.add_a_photo, size: 40, color: Colors.pinkAccent),
                  SizedBox(height: 10),
                  Text("Add Photos", style: TextStyle(color: Colors.grey)),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // Category Dropdown
            DropdownButtonFormField<String>(
              value: _selectedCategory,
              decoration: const InputDecoration(
                labelText: "What are you listing?",
                border: OutlineInputBorder(),
              ),
              items: ['House', 'Activity'].map((String category) {
                return DropdownMenuItem(value: category, child: Text(category));
              }).toList(),
              onChanged: (val) => setState(() => _selectedCategory = val!),
            ),

            const SizedBox(height: 20),

            // Title Input
            const TextField(
              decoration: InputDecoration(
                labelText: "Title",
                hintText: "e.g. Modern Studio near Gate 1",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),

            // Price Input
            const TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Price (Ksh)",
                prefixText: "Ksh ",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 40),

            // The Publish Button
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pinkAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                  // This will eventually save the data
                  Navigator.pop(context);
                },
                child: const Text(
                  "Publish Listing",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
