import 'package:flutter/material.dart';
import 'models/appdata.dart';

class AddListingPage extends StatefulWidget {
  const AddListingPage({super.key});

  @override
  State<AddListingPage> createState() => _AddListingPageState();
}

class _AddListingPageState extends State<AddListingPage> {
  final _nameController = TextEditingController();
  final _priceController = TextEditingController();
  final _descController = TextEditingController();

  String selectedAsset = 'images/nchiru/villahouse.jpg';
  String? selectedArea;
  List<String> selectedAmenities = [];

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

  void _publishListing() {
    if (_nameController.text.isEmpty ||
        _priceController.text.isEmpty ||
        selectedArea == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Please fill in the Name, Price, and Location"),
        ),
      );
      return;
    }

    final newListing = Listing(
      title: _nameController.text,
      price: _priceController.text,
      location: selectedArea!,
      image: selectedAsset,
      description: _descController.text,
      phone: AppData.loggedInLandlordPhone ?? "0700000000",
      amenities: List.from(selectedAmenities),
    );

    // Add to our central list
    setState(() {
      AppData.userListings.add(newListing);
      Navigator.pop(context);
    });

    _showSuccessDialog(context);
  }

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
            // IMAGE PREVIEW
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

            // ASSET GALLERY PICKER
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "Select Property Photo",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 10),
            _buildGalleryPicker(),

            const SizedBox(height: 25),

            // FORM SECTION
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  _buildInput(
                    "Hostel/Villa Name",
                    Icons.business,
                    controller: _nameController,
                  ),
                  const SizedBox(height: 15),

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
                    controller: _priceController,
                  ),

                  const SizedBox(height: 15),

                  // DESCRIPTION FIELD
                  TextField(
                    controller: _descController,
                    maxLines: 4,
                    decoration: _inputDecoration(
                      "Description",
                      Icons.description,
                    ).copyWith(alignLabelWithHint: true),
                  ),

                  const SizedBox(height: 25),

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
                      "WiFi",
                      "Water",
                      "Security",
                      "Hot Shower",
                    ].map((a) => _amenityChip(a)).toList(),
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
                      onPressed: _publishListing, // Calls our new logic
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

  Widget _buildInput(
    String label,
    IconData icon, {
    bool isNumber = false,
    TextEditingController? controller,
  }) {
    return TextField(
      controller: controller,
      keyboardType: isNumber ? TextInputType.number : TextInputType.text,
      decoration: _inputDecoration(label, icon),
    );
  }

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

  Widget _buildGalleryPicker() {
    return SizedBox(
      height: 80,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: availableAssets.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => setState(() => selectedAsset = availableAssets[index]),
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
    );
  }

  Widget _amenityChip(String label) {
    bool isSelected = selectedAmenities.contains(label);
    return FilterChip(
      label: Text(label),
      selected: isSelected,
      onSelected: (bool value) {
        setState(() {
          value
              ? selectedAmenities.add(label)
              : selectedAmenities.remove(label);
        });
      },
      selectedColor: Colors.pinkAccent.withOpacity(0.2),
      checkmarkColor: Colors.pinkAccent,
    );
  }

  // SUCCESS DIALOG
  void _showSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Icon(Icons.check_circle, color: Colors.green, size: 60),
        content: const Text(
          "Listing Published Successfully!",
          textAlign: TextAlign.center,
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context); // Close dialog
              Navigator.pop(context); // Go back to Feed
            },
            child: const Text("Awesome!"),
          ),
        ],
      ),
    );
  }
}
