import 'package:campus_housing/screens/models/appdata.dart';
import 'package:flutter/material.dart';

class Findroommate extends StatefulWidget {
  const Findroommate({super.key});

  @override
  State<Findroommate> createState() => _FindroommateState();
}

class _FindroommateState extends State<Findroommate> {
  // 1. ADD CONTROLLERS
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _courseController = TextEditingController();
  final _budgetController = TextEditingController();
  final _bioController = TextEditingController();

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

  // 2. UPDATED PUBLISH LOGIC
  void _publishProfile() {
    if (_formKey.currentState!.validate()) {
      final newRoommate = Roommate(
        name: _nameController.text,
        phone: _phoneController.text,
        course: _courseController.text,
        gender: selectedGender!,
        status: lookingStatus!,
        budget: _budgetController.text,
        bio: _bioController.text,
        image: selectedAsset,
        habits: List.from(selectedHabits),
      );

      setState(() {
        AppData.userRoommates.add(newRoommate);
      });

      _showSuccessDialog(context);
    } else {
      // If validation fails, a SnackBar is a nice touch
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please fix the errors in red")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Roommate Profile",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
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
                        child: const Icon(
                          Icons.camera_alt,
                          color: Colors.white,
                          size: 20,
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
                    _buildInput(
                      "Full Name",
                      Icons.person_outline,
                      controller: _nameController,
                    ),
                    const SizedBox(height: 15),
                    _buildInput(
                      "WhatsApp Number (e.g. 0712...)",
                      Icons.phone_android_outlined,
                      isNumber: true,
                      controller: _phoneController,
                    ),
                    const SizedBox(height: 15),
                    _buildInput(
                      "Course of Study",
                      Icons.school_outlined,
                      controller: _courseController,
                    ),
                    const SizedBox(height: 15),

                    Row(
                      children: [
                        Expanded(
                          child: DropdownButtonFormField<String>(
                            decoration: _inputDecoration("Gender", Icons.face),
                            items: ["Male", "Female"]
                                .map(
                                  (g) => DropdownMenuItem(
                                    value: g,
                                    child: Text(g),
                                  ),
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
                                  (s) => DropdownMenuItem(
                                    value: s,
                                    child: Text(s),
                                  ),
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
                      controller: _budgetController,
                    ),
                    const SizedBox(height: 15),

                    TextField(
                      controller: _bioController,
                      maxLines: 3,
                      decoration: _inputDecoration(
                        "About Me & Preferences",
                        Icons.edit_note_outlined,
                      ).copyWith(alignLabelWithHint: true),
                    ),

                    const SizedBox(height: 25),
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
                        onPressed: _publishProfile, // Corrected function call
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
      ),
    );
  }

  // --- UI HELPERS ---
  InputDecoration _inputDecoration(String label, IconData icon) {
    return InputDecoration(
      labelText: label,
      prefixIcon: Icon(icon),
      filled: true,
      fillColor: Colors.grey[100],
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide.none,
      ),
    );
  }

  Widget _buildInput(
    String label,
    IconData icon, {
    bool isNumber = false,
    TextEditingController? controller,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: isNumber ? TextInputType.number : TextInputType.text,
      decoration: _inputDecoration(label, icon),

      validator: (value) {
        if (isNumber && label.contains("Number")) {
          if (value == null || value.isEmpty) {
            return 'Please enter your phone number';
          }

          if (value.length != 10) {
            return 'Number must be exactly 10 digits';
          }

          if (!value.startsWith('0')) {
            return 'Should start with 0 (e.g., 07...)';
          }
        }
        if (value == null || value.isEmpty) {
          return 'This field cannot be empty';
        }
        return null;
      },
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
            onPressed: () {
              Navigator.pop(context); // Close dialog
              Navigator.pop(context); // Back to Roommate Feed
            },
            child: const Text("Close"),
          ),
        ],
      ),
    );
  }
}
