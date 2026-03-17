import 'package:flutter/material.dart';

class Findroommate extends StatefulWidget {
  const Findroommate({super.key});

  @override
  State<Findroommate> createState() => _FindroommateState();
}

class _FindroommateState extends State<Findroommate> {
  String selectedAsset = 'images/nchiru/villahouse.jpg';
  String? selectedArea;

  // Inside your State class
  List<String> selectedAmenities = [];

  final List<String> amenitiesList = [
    "WiFi",
    "Water",
    "Security",
    "Hot Shower",
  ];

  // List of all your asset images for the "Gallery Picker"
  final List<String> availableAssets = [
    'images/nchiru/bluehouse.jpg',
    'images/nchiru/greenhouse.jpg',
    'images/nchiru/orangehouse.jpg',
    'images/nchiru/pinkhouse.jpg',
    'images/nchiru/villahouse.jpg',

    'images/mascan/mascan.jpg',
    'images/mascan/studiohouse.jpg',
    'images/mascan/cozyhouse.jpg',
    'images/mascan/funvilla.jpg',
    'images/mascan/campusvilla.jpg',

    'images/alaban/unitygardens.jpg',
    'images/alaban/freedomhouse.jpg',
    'images/alaban/ubuntuhouse.jpg',
    'images/alaban/sunsetvilla.jpg',
    'images/alaban/commonwealthhouse.jpg',

    'images/kunene/qweturesidences.jpg',
    'images/kunene/campusview.jpg',
    'images/kunene/scholarcorners.jpg',
    'images/kunene/nextdoorresidences.jpg',
    'images/kunene/studentsquare.jpg',

    'images/kianjae/unityflats.jpg',
    'images/kianjae/vibingvilla.jpg',
    'images/kianjae/cornerstoneridge.jpg',
    'images/kianjae/studyyardresidences.jpg',
    'images/kianjae/campusgreen.jpg',

    'images/kaithe/tajiriresidences.jpg',
    'images/kaithe/studios.jpg',
    'images/kaithe/fancyflats.jpg',
    'images/kaithe/studenthub.jpg',
    'images/kaithe/youthvilla.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "Post Property",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // IMAGE PREVIEW SECTION
            Container(
              height: 250,
              width: double.infinity,
              margin: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: AssetImage(selectedAsset),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            // ASSET GALLERY PICKER (The "Upload" alternative)
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "Select Property Photo",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 80,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: availableAssets.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () =>
                        setState(() => selectedAsset = availableAssets[index]),
                    child: Container(
                      width: 80,
                      margin: const EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: selectedAsset == availableAssets[index]
                              ? Colors.pinkAccent
                              : Colors.transparent,
                          width: 3,
                        ),
                        image: DecorationImage(
                          image: AssetImage(availableAssets[index]),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 25),

            // FORM SECTION
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  _buildInput("Hostel/Villa Name", Icons.business),
                  const SizedBox(height: 15),

                  // AREA DROPDOWN
                  DropdownButtonFormField<String>(
                    decoration: _inputDecoration("Location", Icons.location_on),
                    items:
                        [
                              "Nchiru",
                              "Mascan",
                              "Alaban",
                              "Kunene",
                              "Kianjae",
                              "Kaithe",
                            ]
                            .map(
                              (area) => DropdownMenuItem(
                                value: area,
                                child: Text(area),
                              ),
                            )
                            .toList(),
                    onChanged: (val) => selectedArea = val,
                  ),

                  const SizedBox(height: 15),
                  _buildInput(
                    "Monthly Rent (Ksh)",
                    Icons.monetization_on,
                    isNumber: true,
                  ),

                  const SizedBox(height: 25),

                  // AMENITIES SECTION
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Amenities Included",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Wrap(
                    spacing: 8,
                    children: [
                      _amenityChip("WiFi"),
                      _amenityChip("Water"),
                      _amenityChip("Security"),
                      _amenityChip("Hot Shower"),
                    ],
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
                      onPressed: () {
                        // Show a success dialog for the presentation
                        _showSuccessDialog(context);
                      },
                      child: const Text(
                        "Publish Listing",
                        style: TextStyle(color: Colors.white, fontSize: 16),
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

  // Helper UI methods
  InputDecoration _inputDecoration(String label, IconData icon) {
    return InputDecoration(
      labelText: label,
      prefixIcon: Icon(icon, color: Colors.grey),
      filled: true,
      fillColor: Colors.grey[100],
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

  Widget _amenityChip(String label) {
    // Check if this specific chip is selected
    bool isSelected = selectedAmenities.contains(label);

    return FilterChip(
      label: Text(label),
      selected: isSelected,
      selectedColor: Colors.pinkAccent.withOpacity(
        0.2,
      ), // Light pink background
      checkmarkColor: Colors.pinkAccent, // The checkmark color
      labelStyle: TextStyle(
        color: isSelected ? Colors.pinkAccent : Colors.black,
        fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: BorderSide(
          color: isSelected ? Colors.pinkAccent : Colors.grey[300]!,
        ),
      ),
      onSelected: (bool value) {
        setState(() {
          if (value) {
            // Add to list if selected
            selectedAmenities.add(label);
          } else {
            // Remove from list if unselected
            selectedAmenities.remove(label);
          }
        });
      },
    );
  }

  void _showSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Icon(Icons.check_circle, color: Colors.green, size: 60),
        content: const Text(
          "Listing Published Successfully!",
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
