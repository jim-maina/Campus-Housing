import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "My Account",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.settings_outlined),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),

            // 1. PROFILE HEADER
            const CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage(
                'images/nchiru/villahouse.jpg',
              ), // Replace with user's actual photo
            ),
            const SizedBox(height: 15),
            const Text(
              "Jane Doe",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const Text(
              "Computer Science • Year 3",
              style: TextStyle(color: Colors.grey),
            ),

            const SizedBox(height: 30),

            // 2. STATS SECTION (Optional but looks professional)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildStatColumn("Favorites", "12"),
                _buildStatColumn("My Posts", "2"),
                _buildStatColumn("Reviews", "5"),
              ],
            ),

            const SizedBox(height: 30),

            // 3. MENU OPTIONS
            _buildMenuTile(
              Icons.person_outline,
              "Edit Roommate Profile",
              Colors.blue,
              () {},
            ),
            _buildMenuTile(
              Icons.favorite_border,
              "Saved Houses",
              Colors.red,
              () {},
            ),
            _buildMenuTile(
              Icons.history,
              "My Browsing History",
              Colors.green,
              () {},
            ),
            _buildMenuTile(
              Icons.notifications_none,
              "Notifications",
              Colors.orange,
              () {},
            ),

            const Divider(height: 40, indent: 20, endIndent: 20),

            _buildMenuTile(Icons.logout, "Logout", Colors.grey, () {
              // Logout Logic
            }),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }

  // Helper for Stats
  Widget _buildStatColumn(String label, String count) {
    return Column(
      children: [
        Text(
          count,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Text(label, style: const TextStyle(color: Colors.grey, fontSize: 12)),
      ],
    );
  }

  // Helper for Menu Rows
  Widget _buildMenuTile(
    IconData icon,
    String title,
    Color iconColor,
    VoidCallback onTap,
  ) {
    return ListTile(
      onTap: onTap,
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: iconColor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(icon, color: iconColor),
      ),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.w500)),
      trailing: const Icon(
        Icons.arrow_forward_ios,
        size: 16,
        color: Colors.grey,
      ),
    );
  }
}
