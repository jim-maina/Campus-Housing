import 'dart:io';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

// 1. Function to open WhatsApp
Future<void> _launchWhatsApp(String phone, String name) async {
  // Format the message to be professional
  String formattedPhone = phone;
  if (phone.startsWith('0')) {
    formattedPhone = '254${phone.substring(1)}';
    final message =
        "Hello $name, I saw your roommate profile on Campus Housing and I'm interested in connecting!";
    final url =
        "https://wa.me/$formattedPhone?text=${Uri.encodeComponent(message)}";

    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch WhatsApp';
    }
  }
}

// 2. Function to open Phone Dialer
Future<void> _makeCall(String phone) async {
  final url = "tel:$phone";
  if (await canLaunchUrl(Uri.parse(url))) {
    await launchUrl(Uri.parse(url));
  } else {
    throw 'Could not launch dialer';
  }
}

class Profilepage extends StatelessWidget {
  final dynamic person; // Receives the roommate data

  const Profilepage({super.key, required this.person});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: const BackButton(color: Colors.black),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. TOP SECTION (Identity)
            Center(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 60,
                    backgroundImage: person.isFromFile
                        ? FileImage(File(person.image)) as ImageProvider
                        : AssetImage(person.image) as ImageProvider,
                  ),
                  const SizedBox(height: 15),
                  Text(
                    person.name,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.location_on,
                        size: 16,
                        color: Colors.pinkAccent,
                      ),
                      Text(
                        " Searching ${person.status == "Has House" ? "Current Location" : "Near Meru Campus"}",
                        style: const TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // 2. KEY INFO (The scannable grid)
            const Text(
              "Key Info",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 15),
            Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.grey[50],
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                children: [
                  _infoRow(
                    Icons.account_balance_wallet,
                    "Budget",
                    "Ksh ${person.budget}",
                  ),
                  const Divider(),
                  _infoRow(Icons.school, "Course", person.course),
                  const Divider(),
                  _infoRow(Icons.phone, "Phone", person.phone),
                  const Divider(),
                  _infoRow(Icons.person, "Gender", person.gender),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // 3. LIFESTYLE / QUALITIES (Chips)
            const Text(
              "Lifestyle",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: (person.habits as List<String>)
                  .map(
                    (habit) => Chip(
                      label: Text(habit),
                      backgroundColor: Colors.pinkAccent.withOpacity(0.1),
                      side: BorderSide.none,
                      labelStyle: const TextStyle(
                        color: Colors.pinkAccent,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                  .toList(),
            ),

            const SizedBox(height: 30),

            // 4. ABOUT SECTION
            const Text(
              "About Me",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              person.bio.isEmpty ? "No description provided." : person.bio,
              style: const TextStyle(color: Colors.black87, height: 1.5),
            ),

            const SizedBox(height: 100), // Space for the bottom button
          ],
        ),
      ),

      // 5. CONTACT BUTTON (Fixed at bottom)
      bottomSheet: Container(
        padding: const EdgeInsets.all(20),
        color: Colors.white,
        child: Row(
          children: [
            // CALL BUTTON
            Expanded(
              child: OutlinedButton.icon(
                onPressed: () => _makeCall(person.phone),
                icon: const Icon(Icons.call, color: Colors.pinkAccent),
                label: const Text("Call"),
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Colors.pinkAccent),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 15),
                ),
              ),
            ),
            const SizedBox(width: 10),
            // WHATSAPP BUTTON
            Expanded(
              child: ElevatedButton.icon(
                onPressed: () => _launchWhatsApp(person.phone, person.name),
                icon: const Icon(Icons.message, color: Colors.green),
                label: const Text("WhatsApp"),
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Colors.pinkAccent),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 15),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _infoRow(IconData icon, String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Icon(icon, size: 20, color: Colors.pinkAccent),
          const SizedBox(width: 15),
          Text(title, style: const TextStyle(color: Colors.grey)),
          const Spacer(),
          Text(value, style: const TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
