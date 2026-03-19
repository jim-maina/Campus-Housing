import 'package:campus_housing/screens/findroommate.dart';
import 'package:campus_housing/screens/mylisting.dart';
import 'package:flutter/material.dart';
import 'landlordsignup.dart';
import 'addlisting.dart';
import 'searchpage.dart';
import 'listingdetail.dart';
import 'studentsignup.dart';
import 'models/appdata.dart';

class ListingsFeed extends StatefulWidget {
  const ListingsFeed({Key? key}) : super(key: key);

  @override
  State<ListingsFeed> createState() => _ListingsFeedState();
}

class _ListingsFeedState extends State<ListingsFeed> {
  int _selectedIndex = 0;
  bool isLoggedIn = false;

  @override
  Widget build(BuildContext context) {
    final Listings = [...AppData.listings, ...AppData.userListings];
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          if (isLoggedIn) {
            await Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const AddListingPage()),
            );
            setState(() {});
          } else {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => LandlordSignupPage(
                  onAuthSuccess: () {
                    setState(() => isLoggedIn = true);
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AddListingPage(),
                      ),
                    );
                  },
                ),
              ),
            );
          }
        },
        label: const Text(
          "Post Listing",
          style: TextStyle(color: Colors.white),
        ),
        icon: const Icon(Icons.add, color: Colors.white),
        backgroundColor: Colors.pinkAccent,
      ),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: Colors.white,
              floating: true, // App bar reappears when you scroll up
              elevation: 0,
              title: const Text(
                "Campus Housing",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              actions: [
                IconButton(
                  icon: const Icon(Icons.person_outline, color: Colors.black),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MyListingsPage(),
                      ),
                    );
                  },
                ),
              ],
            ),
            SliverToBoxAdapter(child: _buildSearchBar(context)),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(top: 10, left: 20, bottom: 10),
                child: Row(
                  children: [
                    _buildCategoryTab(0, "Homes", Icons.home_rounded),
                    const SizedBox(width: 100),
                    _buildCategoryTab(
                      1,
                      "Activities",
                      Icons.local_activity_rounded,
                    ),
                    const SizedBox(width: 100),
                    _buildCategoryTab(2, "roommates", Icons.people_rounded),
                  ],
                ),
              ),
            ),
            // HOMES TAB CONTENT
            if (_selectedIndex == 0) ...[
              SliverList(
                delegate: SliverChildListDelegate([
                  const Divider(height: 40),
                  _buildAreaRow(
                    "Nchiru",
                    Listings.where((l) => l.location == "Nchiru")
                        .map(
                          (l) => {
                            'title': l.title,
                            'price': l.price,
                            'img': l.image,
                            'description': l.description,
                            'amenities': l.amenities,
                          },
                        )
                        .toList(),
                  ),
                  _buildAreaRow(
                    "Mascan",
                    Listings.where((l) => l.location == "Mascan")
                        .map(
                          (l) => {
                            'title': l.title,
                            'price': l.price,
                            'img': l.image,
                            'description': l.description,
                            'amenities': l.amenities,
                          },
                        )
                        .toList(),
                  ),
                  _buildAreaRow(
                    "Alaban",
                    Listings.where((l) => l.location == "Alaban")
                        .map(
                          (l) => {
                            'title': l.title,
                            'price': l.price,
                            'img': l.image,
                            'description': l.description,
                          },
                        )
                        .toList(),
                  ),
                  _buildAreaRow(
                    "Kunene",
                    Listings.where((l) => l.location == "Kunene")
                        .map(
                          (l) => {
                            'title': l.title,
                            'price': l.price,
                            'img': l.image,
                            'description': l.description,
                            'amenities': l.amenities,
                          },
                        )
                        .toList(),
                  ),
                  _buildAreaRow(
                    "Kianjae",
                    Listings.where((l) => l.location == "Kianjae")
                        .map(
                          (l) => {
                            'title': l.title,
                            'price': l.price,
                            'img': l.image,
                            'description': l.description,
                            'amenities': l.amenities,
                          },
                        )
                        .toList(),
                  ),
                  _buildAreaRow(
                    "Kaithe",
                    Listings.where((l) => l.location == "Kaithe")
                        .map(
                          (l) => {
                            'title': l.title,
                            'price': l.price,
                            'img': l.image,
                            'description': l.description,
                            'amenities': l.amenities,
                          },
                        )
                        .toList(),
                  ),
                ]),
              ),
            ] else if (_selectedIndex == 2) ...[
              // ROOMMATES TAB CONTENT
              SliverFillRemaining(
                hasScrollBody: false,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.people_outline,
                        size: 80,
                        color: Colors.grey,
                      ),
                      const SizedBox(height: 20),

                      const Text(
                        "Need someone to share a room with?",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        "Connect with other students looking for housing.",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.grey),
                      ),
                      const SizedBox(height: 30),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.pinkAccent,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 40,
                            vertical: 15,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        onPressed: () {
                          if (isLoggedIn) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Findroommate(),
                              ),
                            );
                          } else {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => StudentsignupPage(
                                  onAuthSuccess: () {
                                    setState(() => isLoggedIn = true);
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const Findroommate(),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            );
                          }
                        },
                        child: const Text(
                          "Find a Roommate",
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // ACTIVITIES TAB CONTENT
            ] else ...[
              const SliverFillRemaining(
                child: Center(
                  child: Text(
                    "Activities coming soon!",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
            const SliverToBoxAdapter(child: SizedBox(height: 100)),
          ],
        ),
      ),
    );
  }

  // Helper widgets for better code organization
  Widget _buildSearchBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: InkWell(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const SearchPage()),
        ),
        borderRadius: BorderRadius.circular(35),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(35),
            border: Border.all(color: Colors.grey.shade200),
            boxShadow: [
              BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10),
            ],
          ),
          child: const Row(
            children: [
              Icon(Icons.search, color: Colors.pinkAccent),
              SizedBox(width: 10),
              Text(
                "Start your search",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Category tab widget for "Homes", "Activities", "Roommates"
  Widget _buildCategoryTab(int index, String label, IconData icon) {
    bool isSelected = _selectedIndex == index;
    return GestureDetector(
      onTap: () => setState(() => _selectedIndex = index),
      child: Column(
        children: [
          Icon(icon, color: isSelected ? Colors.black : Colors.grey),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              color: isSelected ? Colors.black : Colors.grey,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          const SizedBox(height: 6),
          Container(
            height: 2,
            width: 30,
            color: isSelected ? Colors.black : Colors.transparent,
          ),
        ],
      ),
    );
  }

  // Builds a horizontal list of house cards for a specific area, with a "See More" card at the end
  Widget _buildAreaRow(String areaName, List<Map<String, dynamic>> houses) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 25, 20, 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                areaName,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 250,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(left: 20),
            itemCount: houses.length + 1, // Add one for the "See More" card
            itemBuilder: (context, index) {
              if (index == houses.length) {
                return _buildSeeMoreCard(areaName);
              }
              final houseWithLocation = {
                ...houses[index],
                'location': areaName,
              };
              return _buildHouseCard(houseWithLocation);
            },
          ),
        ),
      ],
    );
  }

  // Builds a card widget for a single house listing, which navigates to the details page when tapped
  Widget _buildHouseCard(Map<String, dynamic> house) {
    return InkWell(
      // Navigate to the details page when tapped
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ListingDetailPage(houseData: house),
          ),
        );
      },
      // Card design
      borderRadius: BorderRadius.circular(16),
      child: Container(
        width: 240,
        margin: const EdgeInsets.only(right: 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                house['img'],
                height: 180,
                width: 240,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    height: 180,
                    width: 240,
                    color: Colors.grey[200],
                    child: const Icon(
                      Icons.broken_image_outlined,
                      color: Colors.grey,
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 10),
            Text(
              house['title'],
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text(
              "Ksh ${house['price']} ",
              style: const TextStyle(
                color: Colors.pinkAccent,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Builds a card widget that prompts users to see more listings in a specific area, which would navigate to a new page showing all listings for that area
  Widget _buildSeeMoreCard(String areaName) {
    return InkWell(
      onTap: () {
        // This will navigate to a page showing all listings for this specific area
        print("Navigate to all listings for $areaName");
      },
      child: Container(
        width: 150,
        margin: const EdgeInsets.only(right: 20, bottom: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.arrow_circle_right_outlined,
              size: 40,
              color: Colors.pinkAccent,
            ),
            SizedBox(height: 8),
            Text("See all", style: TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
