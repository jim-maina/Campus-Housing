import 'dart:io';
import 'package:flutter/material.dart';
import 'models/appdata.dart';
import 'listingdetail.dart';

class MyListingsPage extends StatefulWidget {
  const MyListingsPage({super.key});

  @override
  State<MyListingsPage> createState() => _MyListingsPageState();
}

class _MyListingsPageState extends State<MyListingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "My Listings",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: AppData.userListings.isEmpty
          ? _buildEmptyState()
          : ListView.builder(
              padding: const EdgeInsets.all(15),
              itemCount: AppData.userListings.length,
              itemBuilder: (context, index) {
                final house = AppData.userListings[index];
                return _buildMyListingCard(house, index);
              },
            ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.inventory_2_outlined, size: 80, color: Colors.grey[300]),
          const SizedBox(height: 20),
          const Text(
            "You haven't posted any houses yet.",
            style: TextStyle(color: Colors.grey, fontSize: 16),
          ),
        ],
      ),
    );
  }

  Widget _buildMyListingCard(Listing house, int index) {
    // Get the first image path safely
    final String displayImage = house.images.isNotEmpty
        ? house.images.first
        : 'images/placeholder.jpg';

    return Card(
      margin: const EdgeInsets.only(bottom: 15),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 2,
      child: ListTile(
        onTap: () {
          // Allow the landlord to tap their own listing to see the detail view
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ListingDetailPage(
                houseData: {
                  'title': house.title,
                  'price': house.price,
                  'location': house.location,
                  'img': displayImage,
                  'images': house.images,
                  'description': house.description,
                  'phone': house.phone,
                  'amenities': house.amenities,
                  'isFromFile': house.isFromFile,
                },
              ),
            ),
          );
        },
        contentPadding: const EdgeInsets.all(10),
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: house.isFromFile
              ? Image.file(
                  File(displayImage),
                  width: 70,
                  height: 70,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => _errorIcon(),
                )
              : Image.asset(
                  displayImage,
                  width: 70,
                  height: 70,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => _errorIcon(),
                ),
        ),
        title: Text(
          house.title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text("Ksh ${house.price} • ${house.location}"),
        trailing: IconButton(
          icon: const Icon(Icons.delete_outline, color: Colors.redAccent),
          onPressed: () => _confirmDelete(index),
        ),
      ),
    );
  }

  Widget _errorIcon() {
    return Container(
      width: 70,
      height: 70,
      color: Colors.grey[100],
      child: const Icon(Icons.broken_image_outlined, color: Colors.grey),
    );
  }

  void _confirmDelete(int index) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        title: const Text("Delete Listing?"),
        content: const Text(
          "Are you sure you want to remove this property? This action cannot be undone.",
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel", style: TextStyle(color: Colors.grey)),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                AppData.userListings.removeAt(index);
              });
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Listing removed successfully")),
              );
            },
            child: const Text("Delete", style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }
}
