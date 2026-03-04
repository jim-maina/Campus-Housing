import 'package:flutter/material.dart';
import 'searchpage.dart'; // Ensure filename is correct

class ListingsFeed extends StatefulWidget {
  const ListingsFeed({Key? key}) : super(key: key);

  @override
  State<ListingsFeed> createState() => _ListingsFeedState();
}

class _ListingsFeedState extends State<ListingsFeed> {
  int _selectedIndex = 0; // This is the "Memory" for the selected tab

  // 1. FIXED CATEGORY TAB (The one with the underline)
  Widget _buildCategoryTab(int index, String label, IconData icon) {
    bool isSelected = _selectedIndex == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index; // Updates the UI
        });
      },
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
          const SizedBox(height: 8),
          Container(
            height: 2,
            width: 30,
            color: isSelected ? Colors.black : Colors.transparent,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            // 2. SEARCH BAR FIRST (Airbnb Style)
            SliverToBoxAdapter(child: _buildSearchBar(context)),

            // 3. CATEGORY TABS SECOND
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(top: 10, left: 20),
                child: Row(
                  children: [
                    _buildCategoryTab(0, "Houses", Icons.home),
                    const SizedBox(width: 30),
                    _buildCategoryTab(1, "Activities", Icons.event),
                  ],
                ),
              ),
            ),

            // 4. THE CONTENT SWITCH
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: _selectedIndex == 0
                    ? const Text(
                        "Showing House Listings...",
                        style: TextStyle(fontSize: 18),
                      )
                    : const Text(
                        "Showing Activities...",
                        style: TextStyle(fontSize: 18),
                      ),
              ),
            ),

            const SliverFillRemaining(
              child: Center(child: Text('Scroll down for more')),
            ),
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
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(35),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
            border: Border.all(color: Colors.grey.shade200),
          ),
          child: Row(
            children: [
              const Icon(Icons.search, color: Colors.pinkAccent),
              const SizedBox(width: 12),
              const Text(
                "Start your search",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
              const Spacer(),
              const Icon(Icons.tune, size: 18, color: Colors.black),
            ],
          ),
        ),
      ),
    );
  }
}
