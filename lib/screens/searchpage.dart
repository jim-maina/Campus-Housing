import 'package:campus_housing/screens/listingdetail.dart';
import 'package:flutter/material.dart';
import 'models/appdata.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String _searchText = "";

  List<Map<String, dynamic>> _getProcessedList(String query) {
    if (query.trim().isEmpty) return [];

    // Combine both predefined listings and user-added listings
    final allListings = [...AppData.listings, ...AppData.userListings];

    // Filter and convert to Map format for easier handling in the UI
    return allListings
        .where((house) {
          final searchLower = query.trim().toLowerCase();
          return house.location.toLowerCase().contains(searchLower) ||
              house.title.toLowerCase().contains(searchLower);
        })
        .map(
          (l) => {
            // Convert Listing to a Map for easier handling in the UI
            'title': l.title,
            'price': l.price,
            'location': l.location,
            'img': l.image,
          },
        )
        .toList()
      ..sort((a, b) {
        // Sort by price (ascending)
        int priceA = int.tryParse(a['price'].toString()) ?? 0;
        int priceB = int.tryParse(b['price'].toString()) ?? 0;
        return priceA.compareTo(priceB);
      });
  }

  @override
  // This method builds the UI of the SearchPage
  Widget build(BuildContext context) {
    final filteredList = _getProcessedList(_searchText);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: TextField(
          autofocus: true,
          decoration: const InputDecoration(
            hintText: "Find your home...",
            border: InputBorder.none,
          ),
          onChanged: (value) => setState(() => _searchText = value),
        ),
      ),
      body: Column(
        children: [
          const Divider(height: 1),
          Expanded(
            child: filteredList.isEmpty && _searchText.isNotEmpty
                ? const Center(child: Text("No houses found in this area"))
                : ListView.builder(
                    itemCount: filteredList.length,
                    itemBuilder: (context, index) {
                      final house = filteredList[index];
                      return ListTile(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                ListingDetailPage(houseData: house),
                          ),
                        ),
                        leading: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(
                            house['img'],
                            width: 60,
                            height: 60,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stack) =>
                                const Icon(Icons.home, size: 40),
                          ),
                        ),
                        title: Text(
                          house['title'],
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(house['location']),
                        trailing: Text(
                          "Ksh ${house['price']}",
                          style: const TextStyle(
                            color: Colors.pinkAccent,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
