import 'package:flutter/material.dart';
import 'landlordsignup.dart';
import 'addlisting.dart';
import 'searchpage.dart';
import 'listingdetail.dart';
import 'studentsignup.dart';

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
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          if (isLoggedIn) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const AddListingPage()),
            );
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

            if (_selectedIndex == 0) ...[
              SliverList(
                delegate: SliverChildListDelegate([
                  _buildAreaRow("Nchiru", [
                    {
                      'title': 'Blue House',
                      'price': 3500,
                      'img': 'images/nchiru/bluehouse.jpg',
                    },
                    {
                      'title': 'Green House',
                      'price': 3000,
                      'img': 'images/nchiru/greenhouse.jpg',
                    },
                    {
                      'title': 'Orange House',
                      'price': 4000,
                      'img': 'images/nchiru/orangehouse.jpg',
                    },
                    {
                      'title': 'Villa House',
                      'price': 5000,
                      'img': 'images/nchiru/villahouse.jpg',
                    },
                    {
                      'title': 'Pink House',
                      'price': 6000,
                      'img': 'images/nchiru/pinkhouse.jpg',
                    },
                  ]),
                  _buildAreaRow("Mascan", [
                    {
                      'title': 'Mascan Studios',
                      'price': 4500,
                      'img': 'images/mascan/mascan.jpg',
                    },
                    {
                      'title': 'Studio House',
                      'price': 5000,
                      'img': 'images/mascan/studiohouse.jpg',
                    },
                    {
                      'title': 'Cozy House',
                      'price': 6000,
                      'img': 'images/mascan/cozyhouse.jpg',
                    },
                    {
                      'title': 'Fun Villa',
                      'price': 5000,
                      'img': 'images/mascan/funvilla.jpg',
                    },
                    {
                      'title': 'Campus Villa',
                      'price': 4000,
                      'img': 'images/mascan/campusvilla.jpg',
                    },
                  ]),
                  _buildAreaRow("Alaban", [
                    {
                      'title': 'Unity Gardens',
                      'price': 4500,
                      'img': 'images/alaban/unitygardens.jpg',
                    },
                    {
                      'title': 'Freedom House',
                      'price': 3000,
                      'img': 'images/alaban/freedomhouse.jpg',
                    },
                    {
                      'title': 'Ubuntu House',
                      'price': 5000,
                      'img': 'images/alaban/ubuntuhouse.jpg',
                    },
                    {
                      'title': 'Sunset Villa',
                      'price': 4000,
                      'img': 'images/alaban/sunsetvilla.jpg',
                    },
                    {
                      'title': 'Commonwealth House',
                      'price': 7000,
                      'img': 'images/alaban/commonwealthhouse.jpg',
                    },
                  ]),
                  _buildAreaRow("Kunene", [
                    {
                      'title': 'Qwetu Residences',
                      'price': 4500,
                      'img': 'images/kunene/qweturesidences.jpg',
                    },
                    {
                      'title': 'Campus View',
                      'price': 6000,
                      'img': 'images/kunene/campusview.jpg',
                    },
                    {
                      'title': 'Scholar Corners',
                      'price': 5500,
                      'img': 'images/kunene/scholarcorners.jpg',
                    },
                    {
                      'title': 'NextDoor Residences',
                      'price': 4000,
                      'img': 'images/kunene/nextdoorresidences.jpg',
                    },
                    {
                      'title': 'Student Square',
                      'price': 3000,
                      'img': 'images/kunene/studentsquare.jpg',
                    },
                  ]),
                  _buildAreaRow("Kianjae", [
                    {
                      'title': 'Unity Flats',
                      'price': 4500,
                      'img': 'images/kianjae/unityflats.jpg',
                    },
                    {
                      'title': 'Vibing Villa',
                      'price': 6000,
                      'img': 'images/kianjae/vibingvilla.jpg',
                    },
                    {
                      'title': 'Cornerstone Ridge',
                      'price': 3000,
                      'img': 'images/kianjae/cornerstoneridge.jpg',
                    },
                    {
                      'title': 'Study Yard Residences',
                      'price': 7000,
                      'img': 'images/kianjae/studyyardresidences.jpg',
                    },
                    {
                      'title': 'Campus Green',
                      'price': 5000,
                      'img': 'images/kianjae/campusgreen.jpg',
                    },
                  ]),
                  _buildAreaRow("Kaithe", [
                    {
                      'title': 'Tajiri Residences',
                      'price': 6500,
                      'img': 'images/kaithe/tajiriresidences.jpg',
                    },
                    {
                      'title': 'Kaithe Studios',
                      'price': 4000,
                      'img': 'images/kaithe/studios.jpg',
                    },
                    {
                      'title': 'Fancy Flats',
                      'price': 3000,
                      'img': 'images/kaithe/fancyflats.jpg',
                    },
                    {
                      'title': 'Student Hub',
                      'price': 3000,
                      'img': 'images/kaithe/studenthub.jpg',
                    },
                    {
                      'title': 'Youth Villa',
                      'price': 7000,
                      'img': 'images/kaithe/youthvilla.jpg',
                    },
                  ]),
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
                          // Redirect straight to Signup
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => StudentsignupPage(
                                onAuthSuccess: () {
                                  setState(() => isLoggedIn = true);
                                  // After signup, you can redirect them back or to a specific roommate list
                                  Navigator.pop(context);
                                },
                              ),
                            ),
                          );
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
            ] else ...[
              const SliverFillRemaining(
                child: Center(child: Text("No activities posted yet.")),
              ),
            ],
            const SliverToBoxAdapter(child: SizedBox(height: 100)),
          ],
        ),
      ),
    );
  }

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
              const Icon(Icons.chevron_right, color: Colors.black54),
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
              return _buildHouseCard(houses[index]);
            },
          ),
        ),
      ],
    );
  }

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
      // Optional: Adds a nice ripple effect that matches the card shape
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
