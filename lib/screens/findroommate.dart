import 'package:flutter/material.dart';

class Findroommate extends StatefulWidget {
  const Findroommate({super.key});

  @override
  State<Findroommate> createState() => _FindroommateState();
}

class _FindroommateState extends State<Findroommate> {
  // Using a profile-style placeholder or a generic avatar
  String selectedAsset = 'images/nchiru/villahouse.jpg';
  String? selectedGender;
  String? lookingStatus;

  List<String> selectedHabits = [];

  final List<String> habitsList = [
    "Non-smoker",
    "Early Bird",
    "Night Owl",
    "Studious",
    "Clean Freak",
    "Pet Friendly",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "Roommate Profile",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // PROFILE IMAGE SECTION
            Center(
              child: Stack(
                children: [
                  Container(
                    height: 150,
                    width: 150,
                    margin: const EdgeInsets.symmetric(vertical: 20),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.pinkAccent, width: 3),
                      image: DecorationImage(
                        image: AssetImage(selectedAsset),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 20,
                    right: 0,
                    child: CircleAvatar(
                      backgroundColor: Colors.pinkAccent,
                      radius: 20,
                      child: IconButton(
                        icon: const Icon(
                          Icons.camera_alt,
                          color: Colors.white,
                          size: 20,
                        ),
                        onPressed: () {
                          // Image picker logic
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  _buildInput("Full Name", Icons.person_outline),
                  const SizedBox(height: 15),

                  _buildInput(
                    "Course of Study (e.g., Computer Science)",
                    Icons.school_outlined,
                  ),
                  const SizedBox(height: 15),

                  // GENDER & STATUS ROW
                  Row(
                    children: [
                      Expanded(
                        child: DropdownButtonFormField<String>(
                          decoration: _inputDecoration("Gender", Icons.face),
                          items: ["Male", "Female"]
                              .map(
                                (g) =>
                                    DropdownMenuItem(value: g, child: Text(g)),
                              )
                              .toList(),
                          onChanged: (val) =>
                              setState(() => selectedGender = val),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: DropdownButtonFormField<String>(
                          decoration: _inputDecoration(
                            "Status",
                            Icons.home_outlined,
                          ),
                          items: ["Has House", "Searching"]
                              .map(
                                (s) =>
                                    DropdownMenuItem(value: s, child: Text(s)),
                              )
                              .toList(),
                          onChanged: (val) =>
                              setState(() => lookingStatus = val),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),

                  _buildInput(
                    "Budget Range (e.g., 3k - 7k)",
                    Icons.account_balance_wallet_outlined,
                    isNumber: true,
                  ),
                  const SizedBox(height: 15),

                  // BIO / DESCRIPTION
                  TextField(
                    maxLines: 3,
                    decoration: _inputDecoration(
                      "About Me & Preferences",
                      Icons.edit_note_outlined,
                    ).copyWith(alignLabelWithHint: true),
                  ),

                  const SizedBox(height: 25),

                  // HABITS / TAGS SECTION
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "My Lifestyle / Habits",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Wrap(
                    spacing: 8,
                    children: habitsList
                        .map((habit) => _habitChip(habit))
                        .toList(),
                  ),

                  const SizedBox(height: 40),

                  // PUBLISH BUTTON
                  SizedBox(
                    width: double.infinity,
                    height: 55,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.pinkAccent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      onPressed: () => _showSuccessDialog(context),
                      child: const Text(
                        "Post My Profile",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // UI Helpers (Updated for dynamic colors)
  InputDecoration _inputDecoration(String label, IconData icon) {
    return InputDecoration(
      labelText: label,
      prefixIcon: Icon(icon),
      filled: true,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide.none,
      ),
    );
  }

  Widget _buildInput(String label, IconData icon, {bool isNumber = false}) {
    return TextField(
      keyboardType: isNumber ? TextInputType.number : TextInputType.text,
      decoration: _inputDecoration(label, icon),
    );
  }

  Widget _habitChip(String label) {
    bool isSelected = selectedHabits.contains(label);
    return FilterChip(
      label: Text(label),
      selected: isSelected,
      onSelected: (bool value) {
        setState(() {
          value ? selectedHabits.add(label) : selectedHabits.remove(label);
        });
      },
      selectedColor: Colors.pinkAccent.withOpacity(0.2),
      checkmarkColor: Colors.pinkAccent,
    );
  }

  void _showSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Icon(Icons.celebration, color: Colors.orange, size: 60),
        content: const Text(
          "Profile Published! Good luck finding a roommate.",
          textAlign: TextAlign.center,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Close"),
          ),
        ],
      ),
    );
  }
}
