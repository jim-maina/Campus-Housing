import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> _callLandlord(String? phone) async {
  if (phone == null || phone.isEmpty) {
    // Handle cases where no phone is provided
    return;
  }

  final Uri url = Uri.parse("tel:$phone");
  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    print("Could not launch dialer");
  }
}

class ListingDetailPage extends StatelessWidget {
  final Map<String, dynamic> houseData;

  const ListingDetailPage({super.key, required this.houseData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(houseData['img'], fit: BoxFit.cover),
            ),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () => Navigator.pop(context),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        houseData['title'],
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Ksh ${houseData['price']}",
                        style: const TextStyle(
                          fontSize: 20,
                          color: Colors.pinkAccent,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(
                        Icons.location_on,
                        size: 16,
                        color: Colors.grey,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        houseData['location'],
                        style: const TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                  const Divider(height: 40),

                  const Text(
                    "Description",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),

                  Text(
                    houseData['description'] ??
                        "Beautiful campus housing with great views.",
                    style: const TextStyle(color: Colors.grey, fontSize: 15),
                  ),

                  const SizedBox(height: 20),
                  const Text(
                    "Amenities",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),

                  Wrap(
                    spacing: 8,
                    children:
                        (houseData['amenities'] as List<dynamic>?)?.map((item) {
                          return Chip(
                            label: Text(item.toString()),
                            backgroundColor: Colors.pinkAccent.withOpacity(
                              0.05,
                            ),
                            side: BorderSide.none,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          );
                        }).toList() ??
                        [
                          const Text(
                            "Standard amenities included",
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                  ),
                  const SizedBox(height: 100),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomSheet: Container(
        padding: const EdgeInsets.all(20),
        color: Colors.white,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.pinkAccent,
            minimumSize: const Size(double.infinity, 55),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          onPressed: () {
            final phoneNumber = houseData['phone']; // Get the real number
            if (phoneNumber != null && phoneNumber.isNotEmpty) {
              _callLandlord(phoneNumber);
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Landlord contact not available")),
              );
            }
          },
          child: const Text(
            "Contact Landlord",
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
