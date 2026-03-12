import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String _searchText = "";

  final List<Map<String, dynamic>> allHouses = [
    {
      'title': 'Blue House',
      'price': 3500,
      'location': 'Nchiru',
      'img': 'images/nchiru/bluehouse.jpg',
    },
    {
      'title': 'Green House',
      'price': 3000,
      'location': 'Nchiru',
      'img': 'images/nchiru/greenhouse.jpg',
    },
    {
      'title': 'Orange House',
      'price': 4000,
      'location': 'Nchiru',
      'img': 'images/nchiru/orangehouse.jpg',
    },
    {
      'title': 'Villa House',
      'price': 5000,
      'location': 'Nchiru',
      'img': 'images/nchiru/villahouse.jpg',
    },
    {
      'title': 'Pink House',
      'price': 6000,
      'location': 'Nchiru',
      'img': 'images/nchiru/pinkhouse.jpg',
    },
    {
      'title': 'Mascan Studios',
      'price': 4500,
      'location': 'Mascan',
      'img': 'images/mascan/mascan.jpg',
    },
    {
      'title': 'Studio House',
      'price': 5000,
      'location': 'Mascan',
      'img': 'images/mascan/studiohouse.jpg',
    },
    {
      'title': 'Cozy House',
      'price': 6000,
      'location': 'Mascan',
      'img': 'images/mascan/cozyhouse.jpg',
    },
    {
      'title': 'Fun Villa',
      'price': 5000,
      'location': 'Mascan',
      'img': 'images/mascan/funvilla.jpg',
    },
    {
      'title': 'Campus Villa',
      'price': 4000,
      'location': 'Mascan',
      'img': 'images/mascan/campusvilla.jpg',
    },
    {
      'title': 'Unity Gardens',
      'price': 4500,
      'location': 'Alaban',
      'img': 'images/alaban/unitygardens.jpg',
    },
    {
      'title': 'Freedom House',
      'price': 3000,
      'location': 'Alaban',
      'img': 'images/alaban/freedomhouse.jpg',
    },
    {
      'title': 'Ubuntu House',
      'price': 5000,
      'location': 'Alaban',
      'img': 'images/alaban/ubuntuhouse.jpg',
    },
    {
      'title': 'Sunset Villa',
      'price': 4000,
      'location': 'Alaban',
      'img': 'images/alaban/sunsetvilla.jpg',
    },
    {
      'title': 'Commonwealth House',
      'price': 7000,
      'location': 'Alaban',
      'img': 'images/alaban/commonwealthhouse.jpg',
    },
    {
      'title': 'Qwetu Residences',
      'price': 4500,
      'location': 'Kunene',
      'img': 'images/kunene/qweturesidences.jpg',
    },
    {
      'title': 'Campus View',
      'price': 6000,
      'location': 'Kunene',
      'img': 'images/kunene/campusview.jpg',
    },
    {
      'title': 'Scholar Corners',
      'price': 5500,
      'location': 'Kunene',
      'img': 'images/kunene/scholarcorners.jpg',
    },
    {
      'title': 'NextDoor Residences',
      'price': 4000,
      'location': 'Kunene',
      'img': 'images/kunene/nextdoorresidences.jpg',
    },
    {
      'title': 'Student Square',
      'price': 3000,
      'location': 'Kunene',
      'img': 'images/kunene/studentsquare.jpg',
    },
    {
      'title': 'Unity Flats',
      'price': 4500,
      'location': 'Kianjae',
      'img': 'images/kianjae/unityflats.jpg',
    },
    {
      'title': 'Vibing Villa',
      'price': 6000,
      'location': 'Kianjae',
      'img': 'images/kianjae/vibingvilla.jpg',
    },
    {
      'title': 'Cornerstone Ridge',
      'price': 3000,
      'location': 'Kianjae',
      'img': 'images/kianjae/cornerstoneridge.jpg',
    },
    {
      'title': 'Study Yard Residences',
      'price': 7000,
      'location': 'Kianjae',
      'img': 'images/kianjae/studyyardresidences.jpg',
    },
    {
      'title': 'Campus Green',
      'price': 5000,
      'location': 'Kianjae',
      'img': 'images/kianjae/campusgreen.jpg',
    },
    {
      'title': 'Tajiri Residences',
      'price': 6500,
      'location': 'Kaithe',
      'img': 'images/kaithe/tajiriresidences.jpg',
    },
    {
      'title': 'Kaithe Studios',
      'price': 4000,
      'location': 'Kaithe',
      'img': 'images/kaithe/studios.jpg',
    },
    {
      'title': 'Fancy Flats',
      'price': 3000,
      'location': 'Kaithe',
      'img': 'images/kaithe/fancyflats.jpg',
    },
    {
      'title': 'Student Hub',
      'price': 3000,
      'location': 'Kaithe',
      'img': 'images/kaithe/studenthub.jpg',
    },
    {
      'title': 'Youth Villa',
      'price': 7000,
      'location': 'Kaithe',
      'img': 'images/kaithe/youthvilla.jpg',
    },
  ];

  List<Map<String, dynamic>> _getProcessedList(String query) {
    if (query.trim().isEmpty) return [];

    // 2. FILTERING: Use .trim() to avoid issues with accidental spaces
    List<Map<String, dynamic>> results = allHouses.where((house) {
      final location = house['location'].toString().toLowerCase();
      return location.contains(query.trim().toLowerCase());
    }).toList();

    // 3. THE MAGIC SORT: This forces the comparison to be numerical
    results.sort((a, b) {
      int priceA = a['price'] is int
          ? a['price']
          : int.parse(a['price'].toString().replaceAll(',', ''));
      int priceB = b['price'] is int
          ? b['price']
          : int.parse(b['price'].toString().replaceAll(',', ''));
      return priceA.compareTo(priceB);
    });

    return results;
  }

  @override
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
            hintText: "Find your home",
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
                        leading: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(
                            house['img'],
                            width: 60,
                            height: 60,
                            fit: BoxFit.cover,
                          ),
                        ),
                        title: Text(
                          house['title'],
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(house['location']),
                        trailing: Text(
                          "Ksh ${house['price']}", // Visual only
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
