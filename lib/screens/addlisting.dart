import 'package:flutter/material.dart';
import 'models/appdata.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class AddListingPage extends StatefulWidget {
  const AddListingPage({super.key});

  @override
  State<AddListingPage> createState() => _AddListingPageState();
}

class _AddListingPageState extends State<AddListingPage> {
  final _formKey = GlobalKey<FormState>();

  // Multiple images logic
  List<File> _selectedImages = [];
  final ImagePicker _picker = ImagePicker();

  final _nameController = TextEditingController();
  final _priceController = TextEditingController();
  final _descController = TextEditingController();
  final _phoneController = TextEditingController();

  String selectedAsset = 'images/nchiru/villahouse.jpg';
  String? selectedArea;
  List<String> selectedAmenities = [];

  // Function to pick multiple images
  Future<void> _pickMultiImages() async {
    final List<XFile> pickedFiles = await _picker.pickMultiImage(
      imageQuality: 80,
    );

    if (pickedFiles.isNotEmpty) {
      setState(() {
        _selectedImages.addAll(
          pickedFiles.map((file) => File(file.path)).toList(),
        );
      });
    }
  }

  void _publishListing() {
    // Validate form fields
    if (!_formKey.currentState!.validate()) return;

    // Validate location
    if (selectedArea == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please select a Location/Area")),
      );
      return;
    }

    // Prepare image paths
    // If user picked files, use them. If not, use the selected default asset.
    List<String> finalImagePaths = _selectedImages.isNotEmpty
        ? _selectedImages.map((f) => f.path).toList()
        : [selectedAsset];

    final newListing = Listing(
      images: finalImagePaths,
      isFromFile: _selectedImages.isNotEmpty,
      title: _nameController.text,
      price: _priceController.text,
      location: selectedArea!,
      description: _descController.text,
      phone: _phoneController.text,
      amenities: List.from(selectedAmenities),
    );

    setState(() {
      AppData.userListings.add(newListing);
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
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // --- MULTI-IMAGE GALLERY PREVIEW ---
              const Padding(
                padding: EdgeInsets.fromLTRB(16, 16, 16, 8),
                child: Text(
                  "Property Gallery (Tap + to add photos)",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              _buildImageScroll(),

              const SizedBox(height: 20),

              // --- ASSET PICKER (Fallback) ---
              if (_selectedImages.isEmpty) ...[
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    "Or select a default theme photo",
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ),
                const SizedBox(height: 10),
                _buildAssetPicker(),
              ],

              const SizedBox(height: 25),

              // --- FORM SECTION ---
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
                      decoration: _inputDecoration(
                        "Location",
                        Icons.location_on,
                      ),
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
                      validator: (value) => value == null ? "Required" : null,
                    ),

                    const SizedBox(height: 15),
                    _buildInput(
                      "Monthly Rent (Ksh)",
                      Icons.monetization_on,
                      isNumber: true,
                      controller: _priceController,
                    ),

                    const SizedBox(height: 15),

                    TextFormField(
                      controller: _descController,
                      maxLines: 4,
                      decoration: _inputDecoration(
                        "Description",
                        Icons.description,
                      ).copyWith(alignLabelWithHint: true),
                      validator: (value) => value!.isEmpty ? "Required" : null,
                    ),

                    const SizedBox(height: 25),

                    _buildInput(
                      "Phone Number (e.g. 0712...)",
                      Icons.phone_android_outlined,
                      isNumber: true,
                      controller: _phoneController,
                    ),
                    const SizedBox(height: 30),

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
                        onPressed: _publishListing,
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
      ),
    );
  }

  // Horizontal scroll for picked images
  Widget _buildImageScroll() {
    return SizedBox(
      height: 150,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: _selectedImages.length + 1,
        itemBuilder: (context, index) {
          if (index == _selectedImages.length) {
            // Add Button
            return GestureDetector(
              onTap: _pickMultiImages,
              child: Container(
                width: 120,
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.pinkAccent.withOpacity(0.3)),
                ),
                child: const Icon(Icons.add_a_photo, color: Colors.pinkAccent),
              ),
            );
          }

          // Image Preview with Delete Button
          return Stack(
            children: [
              Container(
                width: 120,
                margin: const EdgeInsets.only(right: 12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                    image: FileImage(_selectedImages[index]),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                top: 5,
                right: 17,
                child: GestureDetector(
                  onTap: () => setState(() => _selectedImages.removeAt(index)),
                  child: const CircleAvatar(
                    radius: 12,
                    backgroundColor: Colors.red,
                    child: Icon(Icons.close, size: 14, color: Colors.white),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildAssetPicker() {
    return SizedBox(
      height: 70,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: 30,
        itemBuilder: (context, index) {
          final asset = [
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
          ][index];
          return GestureDetector(
            onTap: () => setState(() => selectedAsset = asset),
            child: Container(
              width: 70,
              margin: const EdgeInsets.only(right: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: selectedAsset == asset
                      ? Colors.pinkAccent
                      : Colors.transparent,
                  width: 2,
                ),
                image: DecorationImage(
                  image: AssetImage(asset),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          );
        },
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
      validator: (value) => value!.isEmpty ? "Required" : null,
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
              Navigator.pop(context);
              Navigator.pop(context);
            },
            child: const Text("Awesome!"),
          ),
        ],
      ),
    );
  }
}
